import 'package:integration_test/integration_test_driver.dart';

/// 让 web 框架运行集成测试的进入点。
///
/// 因为目前官方 integration_test 并不支持 web，所以需要用 webdriver 来代跑。
/// 这个 integrationDriver 的内部原理很简单，主要动作为：
///
/// 1. 启动一个 FlutterDriver，并尝试和 webdriver 相连。
/// 2. 在测试结束后，将 webdriver 反馈写入 `build/integration_response_data.json` --
/// 从结果看，如果测试成功，写入为 null。
///
/// 注意如果是 M1 芯片，连接过程可能永远不会成功，
/// 见：https://dorateam.feishu.cn/docs/doccnFdoCHwyap9JL6HEkn1mK6b
Future<void> main() => integrationDriver();
