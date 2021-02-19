Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD9231FB9A
	for <lists+linux-doc@lfdr.de>; Fri, 19 Feb 2021 16:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhBSPD7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 19 Feb 2021 10:03:59 -0500
Received: from regular1.263xmail.com ([211.150.70.196]:43012 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhBSPDw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Feb 2021 10:03:52 -0500
X-Greylist: delayed 504 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Feb 2021 10:03:47 EST
Received: from localhost (unknown [192.168.167.139])
        by regular1.263xmail.com (Postfix) with ESMTP id EE8791E29;
        Fri, 19 Feb 2021 22:49:18 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from localhost.localdomain (unknown [113.57.152.160])
        by smtp.263.net (postfix) whith ESMTP id P26067T139687450613504S1613746136101578_;
        Fri, 19 Feb 2021 22:49:18 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a75195aedbcefc85eeabb4453b542df8>
X-RL-SENDER: huangjianghui@uniontech.com
X-SENDER: huangjianghui@uniontech.com
X-LOGIN-NAME: huangjianghui@uniontech.com
X-FST-TO: corbet@lwn.net
X-SENDER-IP: 113.57.152.160
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   hjh <huangjianghui@uniontech.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] [PATCH] Documentation/translations: Translate sound/hd-audio/controls.rst into Chinese
Date:   Fri, 19 Feb 2021 22:48:56 +0800
Message-Id: <20210219144856.27362-1-huangjianghui@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: hjh <huangjianghui@uniontech.com>
---
 .../zh_CN/sound/hd-audio/controls.txt         | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/sound/hd-audio/controls.txt

diff --git a/Documentation/translations/zh_CN/sound/hd-audio/controls.txt b/Documentation/translations/zh_CN/sound/hd-audio/controls.txt
new file mode 100644
index 000000000000..7a56c0a648dd
--- /dev/null
+++ b/Documentation/translations/zh_CN/sound/hd-audio/controls.txt
@@ -0,0 +1,117 @@
+Chinese translated version of Documentation/sound/hd-audio/controls.rst
+
+If you have any comment or update to the content, please contact the
+original document maintainer directly.  However, if you have a problem
+communicating in English you can also ask the Chinese maintainer for
+help.  Contact the Chinese maintainer if this translation is outdated
+or if there is a problem with the translation.
+
+Chinese maintainer: Huang Jianghui <huangjianghui@uniontech.com>
+---------------------------------------------------------------------
+Documentation/sound/hd-audio/controls.rst 的中文翻译
+
+如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
+交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
+译存在问题，请联系中文版维护者。
+
+中文版维护者： 黄江慧  Huang Jianghui <huangjianghui@uniontech.com>
+中文版翻译者： 黄江慧  Huang Jianghui <huangjianghui@uniontech.com>
+
+
+以下为正文
+---------------------------------------------------------------------
+======================================
+高清音频编解码器特定混音器控件
+======================================
+
+
+此文件解释特定于编解码器的混音器控件.
+
+瑞昱编解码器
+------------
+
+声道模式
+  这是一个用于更改环绕声道设置的枚举控件,仅在环绕声道打开时显示出现。
+  它给出要使用的通道数:"2ch","4ch","6ch"，和"8ch"。根据配置，这还控
+  制多I/O插孔的插孔重分配。
+
+自动静音模式
+  这是一个枚举控件，用于更改耳机和线路输出插孔的自动静音行为。如果内
+  置扬声器、耳机和/或线路输出插孔在机器上可用，则显示该控件。当只有
+  耳机或者线路输出的时候，它给出”禁用“和”启用“状态。当启用后，插孔插
+  入后扬声器会自动静音。
+
+  当耳机和线路输出插孔都存在时，它给出”禁用“、”仅扬声器“和”线路输出+扬
+  声器“。当”仅扬声器“被选择，插入耳机或者线路输出插孔可使扬声器静音，
+  但不会使线路输出静音。当线路输出+扬声器被选择，插入耳机插孔会同时使扬
+  声器和线路输出静音。
+
+
+矽玛特编解码器
+--------------
+
+模拟环回
+   此控件启用/禁用模拟环回电路。只有在编解码器提示中将”lookback“设置为真
+   时才会出现(见HD-Audio.txt)。请注意，在某些编解码器上，模拟环回和正常
+   PCM播放是独占的,即当此选项打开时，您将听不到任何PCM流。
+
+交换中置/低频
+   交换中置和低频通道顺序，通常情况下，左侧对应中置，右侧对应低频,启动此
+   项后，左边低频，右边中置。
+
+耳机作为线路输出
+   当此控制开启时，将耳机视为线路输出插孔。也就是说，耳机不会自动静音其他
+   线路输出，没有耳机放大器被设置到引脚上。
+
+麦克风插口模式、线路插孔模式等
+   这些枚举控制输入插孔引脚的方向和偏置。根据插孔类型，它可以设置为”麦克风
+   输入“和”线路输入“以确定输入偏置,或者当引脚是环绕声道的多I/O插孔时，它
+   可以设置为”线路输出“。
+
+
+威盛编解码器
+------------
+
+智能5.1
+   一个枚举控件，用于为环绕输出重新分配多个I/O插孔的任务。当它打开时，相应
+   的输入插孔（通常是线路输入和麦克风输入）被切换为环绕和中央低频输出插孔。
+
+独立耳机
+   启用此枚举控制时，耳机输出从单个流（第三个PCM，如hw:0,2）而不是主流路由。
+   如果耳机DAC与侧边或中央低频通道DAC共享，则DAC将自动切换到耳机。
+
+环回混合
+   一个用于确定是否启动了模拟环回路由的枚举控件。当它启用后，模拟环回路由到
+   前置通道。同样，耳机与扬声器输出也采用相同的路径。作为一个副作用，当设置
+   此模式后，单个音量控制将不再适用于耳机和扬声器，因为只有一个DAC连接到混
+   音器小部件。
+
+动态电源控制
+   此控件决定是否启动每个插孔的动态电源控制检测。启用时，根据插孔的插入情况
+   动态更改组件的电源状态（D0/D3）以节省电量消耗。但是，如果您的系统没有提
+   供正确的插孔检测，这将无法工作;在这种情况下，请关闭此控件。
+
+插孔检测
+   此控件仅为VT1708编解码器提供，它不会为每个插孔插拔提供适当的未请求事件。
+   当此控件打开，驱动将轮询插孔检测，以便耳机自动静音可以工作，而关闭此控
+   件将降低功耗。
+
+
+科胜讯编解码器
+-------------
+
+自动静音模式
+   见瑞昱解码器
+
+
+
+模拟编解码器
+-----------
+
+通道模式
+   这是一个用于更改环绕声道设置的枚举控件,仅在环绕声道可用时显示。它提供了能
+   被使用的通道数:”2ch“、”4ch“和”6ch“。根据配置，这还控制多I/O插孔的插孔重
+   分配。
+
+独立耳机
+   启动此枚举控制后，耳机输出从单个流（第三个PCM，如hw:0,2）而不是主流路由。
-- 
2.20.1



