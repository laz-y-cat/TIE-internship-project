from flask import Flask,render_template,request,session,redirect,url_for,flash
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin
from werkzeug.security import generate_password_hash,check_password_hash
from flask_login import login_user,logout_user,login_manager,LoginManager
from flask_login import login_required,current_user


# MY db connection
local_server= True
app = Flask(__name__)
app.secret_key='prarthana@123'


# this is for getting unique user access
login_manager=LoginManager(app)
login_manager.login_view='login'


@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


# app.config['SQLALCHEMY_DATABASE_URL']='mysql://username:password@localhost/databas_table_name'
app.config['SQLALCHEMY_DATABASE_URI']='mysql://root:@localhost/leafnow'
db=SQLAlchemy(app)

# here we will create db models that is tables


class sell(db.Model):
    username=db.Column(db.String(50))
    email=db.Column(db.String(50))
    pid=db.Column(db.Integer,primary_key=True)
    productname=db.Column(db.String(100))
    productdesc=db.Column(db.String(300))
    price=db.Column(db.Integer)


class donate(db.Model):
    username=db.Column(db.String(50))
    email=db.Column(db.String(50))
    did=db.Column(db.Integer,primary_key=True)
    productname=db.Column(db.String(100))
    productdesc=db.Column(db.String(300))
    price=db.Column(db.Integer)


class User(UserMixin,db.Model):
    id=db.Column(db.Integer,primary_key=True)
    username=db.Column(db.String(50))
    email=db.Column(db.String(50),unique=True)
    password=db.Column(db.String(1000))


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/pay')
def pay():
    return render_template('pay.html')


@app.route('/success')
def success():
    return render_template('success.html')



@app.route('/buy')
@login_required
def buy():
    query=db.engine.execute(f"SELECT * FROM `sell`")
    return render_template('buy.html',query=query)


@app.route('/buydonate')
@login_required
def buydonate():
    query=db.engine.execute(f"SELECT * FROM `donate`")
    return render_template('buydonate.html',query=query)





@app.route('/sell',methods=['POST','GET'])
@login_required
def addproduct():
    if request.method=="POST":
        username=request.form.get('username')
        email=request.form.get('email')
        productname=request.form.get('productname')
        productdesc=request.form.get('productdesc')
        price=request.form.get('price')
        products=sell(username=username,email=email,productname=productname,productdesc=productdesc,price=price)
        db.session.add(products)
        db.session.commit()
        return redirect('/buy')
    return render_template('sell.html')


@app.route('/donate',methods=['POST','GET'])
@login_required
def adddonate():
    if request.method=="POST":
        username=request.form.get('username')
        email=request.form.get('email')
        productname=request.form.get('productname')
        productdesc=request.form.get('productdesc')
        price=request.form.get('price')
        prod=donate(username=username,email=email,productname=productname,productdesc=productdesc,price=price)
        db.session.add(prod)
        db.session.commit()
        flash("Product Added","info")
        return redirect('/donatecer')

    return render_template('donate.html')



@app.route('/donatecer')
@login_required
def donatecer():
    return render_template('donatecer.html')


@app.route("/delete/<string:pid>",methods=['POST','GET'])
@login_required
def delete(pid):
    db.engine.execute(f"DELETE FROM `sell` WHERE `sell`.`pid`={pid}")
    return redirect('/pay')



@app.route("/del/<string:did>",methods=['POST','GET'])
@login_required
def dele(did):
    db.engine.execute(f"DELETE FROM `donate` WHERE `donate`.`did`={did}")
    return redirect('/pay')



@app.route('/signup',methods=['POST','GET'])
def signup():
    if request.method == "POST":
        username=request.form.get('username')
        email=request.form.get('email')
        password=request.form.get('password')
        print(username,email,password)
        user=User.query.filter_by(email=email).first()
        if user:
            flash("Email Already Exist","warning")
            return render_template('/signup.html')
        encpassword=generate_password_hash(password)
        new_user=db.engine.execute(f"INSERT INTO `user` (`username`,`email`,`password`) VALUES ('{username}','{email}','{encpassword}')")
        flash("Signup Succes Please Login","success")
        return render_template('login.html')
    return render_template('signup.html')



@app.route('/login',methods=['POST','GET'])
def login():
    if request.method == "POST":
        email=request.form.get('email')
        password=request.form.get('password')
        user=User.query.filter_by(email=email).first()
        if user and check_password_hash(user.password,password):
            login_user(user)
            flash("Login Success","primary")
            return redirect(url_for('index'))
        else:
            flash("invalid credentials","danger")
            return render_template('login.html')
    return render_template('login.html')


@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash("Logout SuccessFul","warning")
    return redirect(url_for('login'))


app.run(debug=True)