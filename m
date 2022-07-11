Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6381D55D03F
	for <lists+linux-doc@lfdr.de>; Tue, 28 Jun 2022 15:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235211AbiF0NOH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Jun 2022 09:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235257AbiF0NNw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jun 2022 09:13:52 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 147D411803
        for <linux-doc@vger.kernel.org>; Mon, 27 Jun 2022 06:11:31 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.112.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0yArLlidQZgAA--.6458S2;
        Mon, 27 Jun 2022 21:11:28 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, zhoubb.aaron@gmail.com,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH] docs/zh_CN: core-api: Add watch_queue Chinese translation
Date:   Mon, 27 Jun 2022 21:11:27 +0800
Message-Id: <20220627131127.10090-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL0yArLlidQZgAA--.6458S2
X-Coremail-Antispam: 1UD129KBjvAXoW3Cr1Uury5Gr4rAr1ftr1DJrb_yoW8Jw1UZo
        W3trZ8Cw4kJF1rXa4Y9an5JFW7WF45uF18JFZ2krn8Z347Aw4xXan3tw15t392yrs5KF1f
        A3W0gw4ruF4rA3WDn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUY57AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
        JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Xr4l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUkHUDUUUUU=
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate core-api/watch_queue.rst into Chinese.

The lastest commit of this file is commit f5461124d59b
("Documentation: move watch_queue to core-api")

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../translations/zh_CN/core-api/index.rst     |   1 +
 .../zh_CN/core-api/watch_queue.rst            | 310 ++++++++++++++++++
 2 files changed, 311 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/watch_queue.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 26d9913fc8b6..7ca44629860c 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -28,6 +28,7 @@
    printk-basics
    printk-formats
    workqueue
+   watch_queue
    symbol-namespaces
 
 数据结构和低级实用程序
diff --git a/Documentation/translations/zh_CN/core-api/watch_queue.rst b/Documentation/translations/zh_CN/core-api/watch_queue.rst
new file mode 100644
index 000000000000..340d2229e85f
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/watch_queue.rst
@@ -0,0 +1,310 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/watch_queue.rst
+
+:翻译:
+
+周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
+
+.. _cn_watch_queue.rst:
+
+
+============
+通用通知机制
+============
+
+通用通知机制是建立在标准管道驱动之上的，它可以有效地将来自内核的通知消息拼接到用
+户空间打开的管道中。这可以与以下方面结合使用::
+
+  * Key/keyring 通知
+
+通知缓冲区可以通过以下方式启用：
+
+	"General setup"/"General notification queue"
+	(CONFIG_WATCH_QUEUE)
+
+文档包含以下章节：
+
+.. contents:: :local:
+
+
+概述
+====
+
+该设施以一种特殊模式打开的管道形式出现，管道的内部环形缓冲区用于保存内核生成的消
+息。然后通过read()读出这些消息。在此类管道上禁用拼接以及类似的操作，因为它们希望
+在某些情况下将其添加的内容还原到环中-这可能最终会与通知消息交错。
+
+管道的所有者必须告诉内核它想通过该管道观察哪些源。只有连接到该管道上的源才会将消
+息插入其中。请注意，一个源可能绑定到多个管道，并同时将消息插入到所有管道中。
+
+还可以将过滤器放置在管道上，以便在不感兴趣时可以忽略某些源类型和子事件。
+
+如果环中没有可用的插槽，或者没有预分配的消息缓冲区可用，则将丢弃消息。在这两种情
+况下，read()都会在读取缓冲区中当前的最后一条消息后，将WATCH_META_LOSS_NOTIFICATION
+插入到输出缓冲区中。
+
+请注意，当生成一个通知时，内核不会等待消费者收集它，而是继续执行。这意味着可以在
+持有自旋锁的同时生成通知，并且还可以保护内核不被用户空间故障无限期地阻碍。
+
+
+消息结构
+========
+
+通知消息由一个简短的头部开始::
+
+	struct watch_notification {
+		__u32	type:24;
+		__u32	subtype:8;
+		__u32	info;
+	};
+
+"type"表示通知记录的来源，"subtype"表示该来源的记录类型（见下文观察源章节）。该类
+型也可以是"WATCH_TYPE_META"。这是一个由观测队列本身在内部生成的特殊记录类型。有两
+个子类型：
+
+  * WATCH_META_REMOVAL_NOTIFICATION
+  * WATCH_META_LOSS_NOTIFICATION
+
+第一个表示安装了观察的对象已被删除或销毁，第二个表示某些消息已丢失。
+
+"info"表示一系列东西，包括：
+
+  * 消息的长度，以字节为单位，包括头（带有WATCH_INFO_LENGTH的掩码，并按
+    WATCH_INFO_LENGTH__SHIFT移位）。这表示记录的大小，可能在8到127字节之间。
+
+  * 观测ID（带有WATCH_INFO_ID掩码，并按WATCH_INFO_ID__SHIFT移位）。这表示观测的主
+    叫ID，可能在0到255之间。多个观测组可以共享一个队列，这提供了一种区分它们的方法。
+
+  * 特定类型的字段（WATCH_INFO_TYPE_INFO）。这是由通知生产者设置的，以指示类型和
+    子类型的某些特定含义。
+
+除长度外，信息中的所有内容都可以用于过滤。
+
+头部后面可以有补充信息。此格式是由类型和子类型决定的。
+
+
+观测列表（通知源）API
+=====================
+
+"观测列表"是订阅通知源的观测者的列表。列表可以附加到对象（比如键或超级块），也可
+以是全局的（比如对于设备事件）。从用户空间的角度来看，一个非全局的观测列表通常是
+通过引用它所属的对象来引用的（比如使用KEYCTL_NOTIFY并给它一个密钥序列号来观测特定
+的密钥）。
+
+为了管理观测列表，提供了以下函数：
+
+  * ::
+
+	void init_watch_list(struct watch_list *wlist,
+			     void (*release_watch)(struct watch *wlist));
+
+    初始化一个观测列表。 如果``release_watch`` 不是NULL，那么这表示当watch_list对
+    象被销毁时，应该调用函数来丢弃观测列表对被观测对象的任何引用。
+
+  * ``void remove_watch_list(struct watch_list *wlist);``
+
+    这将删除订阅watch_list的所有监视，并释放它们，然后销毁watch_list对象本身。
+
+
+观测队列（通知输出）API
+=======================
+
+"观测队列"是由应用程序分配的用以记录通知的缓冲区，其工作原理完全隐藏在管道设备驱
+动中，但必须获得对它的引用才能设置监视。可以通过以下方式进行管理：
+
+  * ``struct watch_queue *get_watch_queue(int fd);``
+
+    由于观测队列在内核中通过实现缓冲区的管道的文件描述符表示，用户空间必须通过系
+    统调用传递该文件描述符，这可以用于从系统调用中查找指向观测队列的不透明指针。
+
+  * ``void put_watch_queue(struct watch_queue *wqueue);``
+
+    该函数用以丢弃从``get_watch_queue()`` 获得的引用。
+
+
+观测订阅API
+===========
+
+“观测”是观测列表上的订阅，表示观测队列，从而表示应写入通知记录的缓冲区。观测队列
+对象还可以携带该对象的过滤规则，由用户空间设置。watch 结构的某些部分可以由驱动程
+序设置::
+
+	struct watch {
+		union {
+			u32		info_id;	/* 在info字段中进行OR运算的ID */
+			...
+		};
+		void			*private;	/* 被观测对象的私有数据 */
+		u64			id;		/* 内部标识符 */
+		...
+	};
+
+``info_id`` 值是从用户空间获得并按WATCH_INFO_ID__SHIFT移位的8位数字。当通知写入关
+联的观测队列缓冲区时，这将与struct watch_notification::info的WATCH_INFO_ID字段进
+行或运算。
+
+``private`` 字段是与watch_list相关联的驱动程序数据，并由``watch_list::release_watch()``
+函数清除。
+
+``id`` 字段是源的ID。使用不同ID发布的通知将被忽略。
+
+提供以下函数来管理观测:
+
+  * ``void init_watch(struct watch *watch, struct watch_queue *wqueue);``
+
+    初始化一个观测对象，把它的指针设置到观察队列中，使用适当的限制来避免死锁。
+
+  * ``int add_watch_to_object(struct watch *watch, struct watch_list *wlist);``
+
+    将观测订阅到观测列表（通知源）。watch结构体中的driver-settable字段必须在调用
+    它之前设置。
+
+  * ::
+
+	int remove_watch_from_object(struct watch_list *wlist,
+				     struct watch_queue *wqueue,
+				     u64 id, false);
+
+    从观测列表中删除一个观测，该观测必须与指定的观测队列（``wqueue``）和对象标识
+    符（``id``）匹配。通知（``WATCH_META_REMOVAL_NOTIFICATION``）被发送到观测队列
+    表示该观测已被删除。
+
+  * ``int remove_watch_from_object(struct watch_list *wlist, NULL, 0, true);``
+
+    从观测列表中删除所有观测。 预计这将被称为销毁前的准备工作，届时新的观测将无法
+    访问观测列表。通知（``WATCH_META_REMOVAL_NOTIFICATION``）被发送到每个订阅观测
+    的观测队列，以表明该观测已被删除。
+
+
+通知发布API
+===========
+
+要将通知发布到观测列表以便订阅的观测可以看到，应使用以下函数::
+
+	void post_watch_notification(struct watch_list *wlist,
+				     struct watch_notification *n,
+				     const struct cred *cred,
+				     u64 id);
+
+应预先设置通知格式，并应传入一个指向头部（``n``）的指针。通知可能大于此值，并且缓
+冲槽为单位的大小在``n->info & WATCH_INFO_LENGTH`` 中注明。
+
+``cred`` 结构表示源（对象）的证书，并传递给LSM，例如SELinux，以允许或禁止根据该队
+列（对象）的证书在每个单独队列中记录注释。
+
+``id`` 是源对象ID（如密钥上的序列号）。只有设置相同ID的观测才能看到这个通知。
+
+
+观测源
+======
+
+任何特定的缓冲区都可以从多个源获取信息。 这些源包括:
+
+  * WATCH_TYPE_KEY_NOTIFY
+
+    这种类型的通知表示密钥和密钥环的变化，包括密钥环内容或密钥属性的变化。
+
+    更多信息请参见Documentation/security/keys/core.rst。
+
+
+事件过滤
+========
+
+当创建观测队列后，我们可以应用一组过滤器以限制接收的事件::
+
+	struct watch_notification_filter filter = {
+		...
+	};
+	ioctl(fd, IOC_WATCH_QUEUE_SET_FILTER, &filter)
+
+过滤器的描述的类型变量是::
+
+	struct watch_notification_filter {
+		__u32	nr_filters;
+		__u32	__reserved;
+		struct watch_notification_type_filter filters[];
+	};
+
+其中"nr_filters"表示filters[]数组中过滤器的数量，而"__reserved"应为0。
+"filter"数组有以下类型的元素::
+
+	struct watch_notification_type_filter {
+		__u32	type;
+		__u32	info_filter;
+		__u32	info_mask;
+		__u32	subtype_filter[8];
+	};
+
+其中：
+
+  * ``type`` 是过滤的事件类型，应类似于"WATCH_TYPE_KEY_NOTIFY"。
+
+  * ``info_filter`` 与``info_mask`` 充当通知记录的信息字段的过滤器，只有在以下情
+    况，通知才会写入缓冲区::
+
+	(watch.info & info_mask) == info_filter
+
+    例如，这可以用于忽略不在一个挂载树上的观测点的事件。
+
+  * ``subtype_filter`` 是一个位掩码，表示感兴趣的子类型。subtype_filter[0]的
+    bit[0]对应子类型0，bit[1]对应子类型1，以此类推。
+
+若ioctl()的参数为NULL，则过滤器将被移除，并且来自观测源的所有事件都将通过。
+
+
+用户空间代码示例
+================
+
+缓冲区的创建如下所示::
+
+	pipe2(fds, O_TMPFILE);
+	ioctl(fds[1], IOC_WATCH_QUEUE_SET_SIZE, 256);
+
+它可以被设置成接收密钥环变化的通知::
+
+	keyctl(KEYCTL_WATCH_KEY, KEY_SPEC_SESSION_KEYRING, fds[1], 0x01);
+
+然后，这些通知可以被如下方式所使用::
+
+	static void consumer(int rfd, struct watch_queue_buffer *buf)
+	{
+		unsigned char buffer[128];
+		ssize_t buf_len;
+
+		while (buf_len = read(rfd, buffer, sizeof(buffer)),
+		       buf_len > 0
+		       ) {
+			void *p = buffer;
+			void *end = buffer + buf_len;
+			while (p < end) {
+				union {
+					struct watch_notification n;
+					unsigned char buf1[128];
+				} n;
+				size_t largest, len;
+
+				largest = end - p;
+				if (largest > 128)
+					largest = 128;
+				memcpy(&n, p, largest);
+
+				len = (n->info & WATCH_INFO_LENGTH) >>
+					WATCH_INFO_LENGTH__SHIFT;
+				if (len == 0 || len > largest)
+					return;
+
+				switch (n.n.type) {
+				case WATCH_TYPE_META:
+					got_meta(&n.n);
+				case WATCH_TYPE_KEY_NOTIFY:
+					saw_key_change(&n.n);
+					break;
+				}
+
+				p += len;
+			}
+		}
+	}
-- 
2.20.1

