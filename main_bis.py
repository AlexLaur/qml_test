import os
import sys
import getpass

from PySide2 import QtGui, QtCore, QtWidgets, QtQml

SCRIPT_PATH = os.path.dirname(__file__)


class MainApp(QtCore.QObject):
    def __init__(self, context, parent=None):
        super(MainApp, self).__init__(parent)

        self.win = parent
        self.ctx = context

        self.win.findChild(QtCore.QObject, 'my_button_1').clicked.connect(self.test1)


    def check_co(self, login, password):
        if login == getpass.getuser() and password == '0000':
            return 'Hi %s. Happy to see you !' % login
        else:
            return 'Login or Password incorrect'


    def test1(self):
        login = self.win.findChild(QtCore.QObject, 'txf_login').property('text')
        password = self.win.findChild(QtCore.QObject, 'txf_password').property('text')
        result = self.check_co(login, password)
        self.win.findChild(QtCore.QObject, 'result_label').setProperty('text', result)


    @QtCore.Slot(str, str, result=str)
    def test2(self, login, password):
        print(login, password)
        txt = self.check_co(login, password)
        self.ctx.setContextProperty('result_val', txt)


    @QtCore.Slot(str, str)
    def test3(self, login, password):
        print(login, password)
        return self.check_co(login, password)


if __name__ == '__main__':
    app = QtGui.QGuiApplication(sys.argv)
    engine = QtQml.QQmlApplicationEngine()
    # Creation of a QQmlContext in order to communicate with the QML
    ctx = engine.rootContext()
    qml_path = os.path.join(SCRIPT_PATH, 'ui', 'main_bis.qml')
    engine.load(qml_path)
    win = engine.rootObjects()[0]
    main_app = MainApp(ctx, win)
    ctx.setContextProperty('py_MainApp', main_app)
    win.show()
    sys.exit(app.exec_())
