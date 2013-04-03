SDWebDataManager

/*
 来自成都本土的程序员,
 热忱希望与大家一起交流IOS和MAC开发的心得，
 作者的博客:  http://tanhao.sinaapp.com/ （刚将博客搬于此，所有的发帖都汇集于此了，希望大家来给我带来一些人气哈，哈哈）
*/

历史版本：

SDWebData v1.1.1
更新:
1.修正当cacheMaxCacheAge设置过小的时候，无法实现文件缓存的BUG.

SDWebData v1.1.0
更新:
*.将库中所有代码修改为ARC的代码,(仍然使用手动release,retain的工程不能使用这个版本的代码);
1.SDDataCache更名为SDDataCacheManager，因为这是一个单例类，这些的命名更统一规范;
2.SDDataCacheManager新增了memCacheMaxSize属性（单位B），默认为2M（2*1024*1024）;
3.SDDataCacheManager新增了cacheMaxCacheAge属性（硬盘缓存的过期时间,单位秒），默认为1周（7*24*60*60）;
4.SDWebDataManager的回调方法中，去掉了SDWebDataManager的参数，因为SDWebDataManager本身为单例类，返回该对象无实质意义;
5.SDWebDataManager所有的请求,在属性中增加类型为id的context参数,在回调中并返回,方便同一个delegate发起不同的请求;
6.SDWebDataManager增加方便的Post请求方法,并且支持文件上传;
7.SDWebDataManager新增MaxConcurrentCount属性,用于限制并发请求的数量,当同时请求数量过多时,可防止对主线程的拥塞.


SDWebData v1.0.2
更新:
1.SDWebDataManager的代理方法webDataManager:didFinishWithData:更新为webDataManager:didFinishWithData:isCache:,新增一个用以表示是否
为缓存数据的标识。
2.新增了SDNetworkActivityIndicator类,用于标识当前的网络状态。

SDWebData v1.0.1
更新:
1.修改了SDDataCache实例方法cleanDisk,因为原版的是当文件的更新时间等于某个特定的时间时就删除，
但是却没有考虑到如果文件刚好过期的当天没有使用软件则不能清除。
2.增加了当UIApplicationWillResignActiveNotification消息时执行cleanDisk，因为原版本中只有UIApplicationWillTerminateNotification
消息时才cleanDisk，但此消息在IOS4上不再适合了。

SDWebData v1.0.0
功能：
1.它是以SDWebImage为原型，改造成的对服务器返回的NSData对象的缓存技术。(SDWebImage只能对于NSImage或UIImage有效)；
2.同时也封装了一个SDImageView+SDWebCache，它是NSImageView或UIImageView的一个category,实现了异步加载和缓存技术。