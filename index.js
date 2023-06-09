import App from './RNClass/App';

import {AppRegistry} from 'react-native';



// AppRegistry是所有 React Native 应用的 JS 入口。
// 应用的根组件应当通过AppRegistry.registerComponent方法注册自己，
// 然后原生系统才可以加载应用的代码包并且在启动完成之后通过调用AppRegistry.runApplication来真正运行应用。
//注意 Module name 要与APP相一致
AppRegistry.registerComponent('ReactApplicationMain', () => App);
