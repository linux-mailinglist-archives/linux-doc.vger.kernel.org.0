Return-Path: <linux-doc+bounces-2665-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 274367F0FAA
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 11:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F4221F2325F
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 10:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD83125D1;
	Mon, 20 Nov 2023 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id E67D2EB
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 02:02:35 -0800 (PST)
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8BxHOu6LltlKy87AA--.46980S3;
	Mon, 20 Nov 2023 18:02:34 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxP92yLltlJG5HAA--.27432S3;
	Mon, 20 Nov 2023 18:02:27 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: corbet@lwn.net,
	seakeel@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	alexs@kernel.org,
	bobwxc@email.cn,
	wu.xiangcheng@linux.dev,
	yizhou.tang@shopee.com,
	linux-doc@vger.kernel.org,
	chenhuacai@kernel.org
Subject: [PATCH v1 1/3] docs/zh_CN: add process maintainer-pgp-guide tanslation
Date: Mon, 20 Nov 2023 18:02:23 +0800
Message-Id: <7c7f24f653468c9a2c7e3909a7a390ea36eec879.1700474235.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1700474235.git.siyanteng@loongson.cn>
References: <cover.1700474235.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxP92yLltlJG5HAA--.27432S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfuw4DZry8ZF43ur1DKr4rZwc_yoWrGFyxCo
	WYvrZavw4rKrW3J3WrGa17WFWUGF1kKFnrCF47CrsrCr13GF1rAr18ArnrGrZxuFZ8Aa15
	tw1rWry3C3W8J3Z5l-sFpf9Il3svdjkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrnO8qx4xG64xvF2IEw4CE5I8CrVC2j2WlIxkvb40EIxkG14v26r4j6ryU
	Yxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUUbg8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr
	1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK
	0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4
	x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l
	84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYY7kG6IIYr7AKxVW8JVW5JwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6r
	yUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7IU8IJPtUUUUU==

Translate process/maintainer-pgp-guide.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/process/index.rst      |   1 +
 .../zh_CN/process/maintainer-pgp-guide.rst    | 789 ++++++++++++++++++
 2 files changed, 790 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst

diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
index a1a35f88f4ae..5af0c2735902 100644
--- a/Documentation/translations/zh_CN/process/index.rst
+++ b/Documentation/translations/zh_CN/process/index.rst
@@ -29,6 +29,7 @@
    submitting-patches
    programming-language
    coding-style
+   maintainer-pgp-guide
    development-process
    email-clients
    license-rules
diff --git a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
new file mode 100644
index 000000000000..eb12694a4c59
--- /dev/null
+++ b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
@@ -0,0 +1,789 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/process/maintainer-pgp-guide.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+===================
+内核维护者 PGP 指南
+===================
+
+:作者: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
+
+本文档面向 Linux 内核开发者，特别是子系统维护人员。文档中含有Linux 基金
+会发布的更通用的 `保护代码完整性`_ 指南中讨论的内容子集。阅读该文档，以更
+深入地讨论本指南中提到的一些主题。
+
+.. _`保护代码完整性`: https://github.com/lfit/itpol/blob/master/protecting-code-integrity.md
+
+PGP 在 Linux 内核开发中的作用
+=============================
+
+PGP 有助于确保 Linux 内核开发社区产出代码的完整性，并在较小程度上，通过
+PGP 签名的电子邮件交换，在开发者之间建立可信的交流渠道。
+
+Linux 内核源代码主要有两种（维护）方式:
+
+- 分布式源仓库 (git)
+- 定期发布快照 (tarballs)
+
+git 仓库和 tarball 都带有创建官方内核版本的内核开发者的 PGP 签名。这
+些签名提供了加密保证，即保证 kernel.org 或任何其他镜像提供的可下载版本
+与这些开发者在其工作站上的版本相同。为此:
+
+- git 仓库在所有标签上提供 PGP 签名
+- tarball 为所有下载提供独立的 PGP 签名
+
+信任开发者，不要信基础设施
+--------------------------
+
+自从 2011 年 kernel.org 核心系统遭到入侵以来，内核存档项目的主要运行原
+则就是假定基础设施的任何部分都可能随时受到入侵。因此，管理员特意采取措施，
+强调必须始终信任开发者，不能信任代码托管基础设施，无论后者的安全实践有多好。
+
+上述指导原则正是需要本指南的原因。希望确保通过对开发者的信任，我们不会简
+单地将未来潜在安全事件的责任归咎于其他人。目的是提供一套指导开发者可以用
+来创建安全的工作环境并保护用于建立 Linux 内核本身完整性的 PGP 密钥。
+
+PGP 工具
+========
+
+使用 GnuPG 2.2 或更高版本
+-------------------------
+
+默认情况下，你的发行版应该已经安装了 GnuPG，你只需要验证你使用的是相当新的
+版本即可。要检查，请运行::
+
+    $ gpg --version | head -n1
+
+如果你有 2.2 或更高版本，那么你就可以开始了。如果你的版本早于 2.2，则本指
+南中的某些命令可能不起作用。
+
+配置 gpg-agent 选项
+~~~~~~~~~~~~~~~~~~~
+
+GnuPG agent是一个辅助工具，每当你使用该命令时，它都会自动启动gpg，并在
+后台运行，目的是缓存私钥密码。你应该知道两个选项，以便调整密码何时从缓存
+过期:
+
+- ``default-cache-ttl`` (秒): 如果在生命周期结束之前再次使用相同的
+  密钥，倒计时将重置为另一段时间。默认值为 600（10 分钟）。
+- ``max-cache-ttl`` (秒): 无论你自输入初始密码以来多久使用过密钥，
+  如果最大生存时间倒计时结束，你都必须再次输入密码。默认值为 30 分钟。
+
+如果你发现这些默认值太短（或太长），你可以编辑 ``~/.gnupg/gpg-agent.conf``
+文件以设置你自己的值::
+
+    # 常规ttl设置为30分钟，最大ttl设置为2小时
+    default-cache-ttl 1800
+    max-cache-ttl 7200
+
+.. note::
+
+    不需要在 shell 会话开始时手动启动 gpg-agent。你可能需要检查
+    rc 文件来删除旧版本 GnuPG 中的所有内容，因为它可能不再做正确
+    的事情。
+
+保护你的 PGP 密钥
+=================
+
+本指南假定你已经拥有用于 Linux 内核开发目的的 PGP 密钥。如果你还没
+有，请参阅前面提到的 "`保护代码完整性`_" 文档，以获取有关如何创建新
+密钥的指导。
+
+如果你当前的密钥低于 2048 位 (RSA)，你还应该创建一个新密钥。
+
+了解 PGP 子密钥
+---------------
+
+PGP 密钥很少由单个密钥对组成 - 通常它是独立子密钥的集合，这些子密钥
+可根据其功能用于不同的目的，并在创建时分配。PGP 定义了密钥可以具有的
+四种功能:
+
+- **[S]** 密钥可用于签名
+- **[E]** 密钥可用于加密
+- **[A]** 密钥可用于身份验证
+- **[C]** 密钥可用于验证其他密钥
+
+具有 **[C]** 功能的密钥通常称为“主”密钥，但该术语具有误导性，因为
+它意味着可以使用Certify密钥来代替同一链上的任何其他子密钥（如物理
+“主密钥”可用于打开为其他钥匙制作的锁）。由于情况并非如此，本指南将
+其称为“认证密钥”以避免任何歧义。
+
+充分理解以下内容至关重要:
+
+1. 所有子项彼此完全独立。如果你丢失了私有子密钥，则无法从链上的任何
+   其他私钥恢复或重新创建它。
+2. 除 Certify 密钥外，可以有多个具有相同功能的子密钥（例如，你可
+   以有 2 个有效的加密子密钥、3 个有效的签名子密钥，但只有 1 个有
+   效的认证子密钥）。所有子密钥都是完全独立的——加密到一个 **[E]**
+   子密钥的信息（messages）无法使用你可能拥有的任何其他 **[E]**
+   子密钥解密。
+3. 单个子密钥可能具有多种功能（例如，你的 **[C]** 密钥也可以是你
+   的 **[S]** 密钥）。
+
+携带 **[C]** （证明）能力的密钥是唯一可以用来指示与其他密钥的关系
+的密钥。仅 **[C]** 密钥可用于:
+
+- 添加或撤销具有 S/E/A 功能的其他密钥（子密钥）
+- 添加、更改或撤销与密钥关联的身份 (uid)
+- 添加或更改其本身或任何子密钥的到期日期
+- 出于信任网络的目的签署其他人的密钥
+
+默认情况下，GnuPG 在生成新密钥时创建以下内容:
+
+- 一个子密钥同时具有认证和签名功能 (**[SC]**)
+- 具有加密功能的单独子密钥 (**[E]**)
+
+如果你在生成密钥时使用了默认参数，那么这就是你将得到的。你可以通过
+运行命令来验证，例如： ``gpg --list-secret-keys``
+
+::
+
+    sec   ed25519 2022-12-20 [SC] [expires: 2024-12-19]
+          000000000000000000000000AAAABBBBCCCCDDDD
+    uid           [ultimate] Alice Dev <adev@kernel.org>
+    ssb   cv25519 2022-12-20 [E] [expires: 2024-12-19]
+
+在 ``sec`` 这行下面长长的一行就是你的密钥指纹-无论在下文任何地方
+看到 ``[fpr]`` 都指的是这40个字符。
+
+确保你的密码强度高
+------------------
+
+GnuPG 在将私钥存储到磁盘之前使用密码对其进行加密。这样，即使你的
+``.gnupg`` 目录全部泄露或被盗，攻击者在没有事先获取密码来解密的
+情况下也无法使用你的私钥。
+
+你的私钥受到强密码保护是绝对必要的。要设置或更改它，请使用::
+
+    $ gpg --change-passphrase [fpr]
+
+创建一个单独的签名子密钥
+------------------------
+
+我们的目的是通过将你的证书密钥移动到离线媒介来保护它，因此如果你只
+有组合的 **[SC]** 密钥，那么你应该创建一个单独的签名子密钥::
+
+    $ gpg --quick-addkey [fpr] ed25519 sign
+
+.. note:: GnuPG 中的 ECC 支持
+
+    请注意，如果你打算使用不支持 ED25519 ECC 密钥的硬件密钥，则
+    应选择“nistp256”或“ed25519”。请参阅下面有关推荐硬件设备的
+    部分。
+
+
+备份你的证书密钥以进行灾难恢复
+------------------------------
+
+你的 PGP 密钥上来自其他开发者的签名越多，出于灾难恢复的原因，你就越
+有理由创建一个位于数字媒体之外的备份版本。
+
+创建私钥的可打印硬拷贝的最佳方法是使用 ``paperkey`` 为此目的编写
+的软件。有关输出格式及其相对于其他解决方案的优势的更多详细信息，请参
+阅 ``paperkey`` 参考资料。大多数发行版都应该已经打包了 Paperkey。
+
+运行以下命令来创建私钥的硬拷贝备份::
+
+    $ gpg --export-secret-key [fpr] | paperkey -o /tmp/key-backup.txt
+
+打印出该文件（或将输出直接传输到 lpr），然后用笔在纸的边缘写下你的密
+码。 **强烈建议这样做**，因为密钥打印输出仍然使用该密码进行加密，并且
+如果你更改了它，你将不记得创建备份时它曾经是什么 - *保证*。
+
+将生成的打印输出和手写密码放入信封中，并存放在安全且受到良好保护的地
+方，最好远离你的家，例如银行保险柜。
+
+.. note::
+
+    你的打印机可能不再是连接到并行端口的简单哑设备，但由于输出仍然使
+    用你的密码进行加密，因此即使“云端打印”的现代打印机也应该保持相
+    对安全的操作
+
+备份整个 GnuPG 目录
+-------------------
+
+.. warning::
+
+    **!!!不要跳过这个步骤!!!**
+
+如果你需要恢复 PGP 密钥，拥有一个随时可用的备份非常重要。这与我们
+所做的灾难级准备不同 ``paperkey`` 。每当你需要使用你的证书密钥时，
+例如在会议和峰会后更改你自己的密钥或签署其他人的密钥时，你还将依赖
+这些外部副本。
+
+首先获取一个小型 USB “拇指” 驱动器（最好是两个！），用于备份目的。
+你需要使用 LUKS 对其进行加密——请参阅你的发行版文档以了解如何完成
+此操作。
+
+对于加密密码，你可以使用与 PGP 密钥相同的密码。
+
+加密过程完成后，重新插入 USB 驱动器并确保其正确安装。将整个 ``.gnupg``
+目录复制到加密存储::
+
+    $ cp -a ~/.gnupg /media/disk/foo/gnupg-backup
+
+你现在应该测试一下，确保一切依然能正常工作::
+
+    $ gpg --homedir=/media/disk/foo/gnupg-backup --list-key [fpr]
+
+如果没有出现任何错误，那么就可以开始了。卸下 USB 驱动器，给它贴上
+明显的标签，这样下次需要使用随机 USB 驱动器时就不会把它吹走，然后
+放在安全的地方 - 但不要太远，因为你每次都需要使用它时不时地用于诸
+如编辑身份、添加或撤销子密钥或签署其他人的密钥之类的事情。
+
+从你的 homedir 中删除 Certify 密钥
+----------------------------------
+
+我们的主目录中的文件并没有我们想象的那么受到保护。它们可以通过多种
+不同的方式泄露或被盗:
+
+- 在制作快速主目录备份以设置新工作站时意外发生
+- 系统管理员的疏忽或恶意
+- 通过不安全的备份
+- 通过桌面应用程序（浏览器、pdf 查看器等）中的恶意软件
+- 跨越国界时通过胁迫
+
+使用良好的密码短语保护你的密钥极大地有助于降低上述任何风险，但密码
+短语可以通过键盘记录器、肩窥或任何其他方式发现。因此，建议的设置是
+从主目录中删除你的证书密钥并将其存储在离线存储中。
+
+.. warning::
+
+    请参阅上一节并确保你已完整备份 GnuPG 目录。如果你没有可用的
+    备份，我们要做的事情将使你的密钥毫无用处！
+
+首先，确定你的证书密钥的keygrip::
+
+    $ gpg --with-keygrip --list-key [fpr]
+
+输出将是这样的::
+
+    pub   ed25519 2022-12-20 [SC] [expires: 2022-12-19]
+          000000000000000000000000AAAABBBBCCCCDDDD
+          Keygrip = 1111000000000000000000000000000000000000
+    uid           [ultimate] Alice Dev <adev@kernel.org>
+    sub   cv25519 2022-12-20 [E] [expires: 2022-12-19]
+          Keygrip = 2222000000000000000000000000000000000000
+    sub   ed25519 2022-12-20 [S]
+          Keygrip = 3333000000000000000000000000000000000000
+
+找到该线 ``pub`` 下方的keygrip项 （位于“认证密钥指纹”的正下方）。
+这将直接对应于你``~/.gnupg`` 目录中的一个文件::
+
+    $ cd ~/.gnupg/private-keys-v1.d
+    $ ls
+    1111000000000000000000000000000000000000.key
+    2222000000000000000000000000000000000000.key
+    3333000000000000000000000000000000000000.key
+
+你所要做的只是删除与证书密钥 keygrip 对应的 .key 文件::
+
+    $ cd ~/.gnupg/private-keys-v1.d
+    $ rm 1111000000000000000000000000000000000000.key
+
+现在，如果你发出命令 ``--list-secret-keys`` ，它将显示证书密钥丢
+失（ 表示 ``#`` 它不可用）::
+
+    $ gpg --list-secret-keys
+    sec#  ed25519 2022-12-20 [SC] [expires: 2024-12-19]
+          000000000000000000000000AAAABBBBCCCCDDDD
+    uid           [ultimate] Alice Dev <adev@kernel.org>
+    ssb   cv25519 2022-12-20 [E] [expires: 2024-12-19]
+    ssb   ed25519 2022-12-20 [S]
+
+你还应该删除 ``~/.gnupg``目录中的所有 ``secring.gpg`` 文件 ，这些
+文件可能是以前版本的 GnuPG 留下的。
+
+如果你没有“private-keys-v1.d”目录
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+如果你没有 ``~/.gnupg/private-keys-v1.d`` 目录，那么你的密钥仍存
+储在 GnuPG v1 使用的旧文件 ``secring.gpg`` 中。对密钥进行任何更改
+（例如更改密码或添加子密钥）应该会自动转换旧 ``secring.gpg`` 格式以
+供使用 ``private-keys-v1.d`` 。
+
+完成此操作后，请确保删除过时的 ``secring.gpg`` 文件，其中仍然包含你
+的私钥。
+
+
+将子密钥移至专用加密设备
+========================
+
+尽管 Certify 密钥现在不会被泄露或被盗，但子密钥仍然位于你的主目录中。
+任何设法获得这些内容的人都将能够解密你的通信或伪造你的签名（如果他们知
+道密码）。此外，每次执行 GnuPG 操作时，密钥都会加载到系统内存中，并
+可能被足够高级的恶意软件（例如 Meltdown 和 Spectre）从那里窃取。
+
+完全保护密钥的最佳方法是将它们转移到能够进行智能卡操作的专用硬件设备上。
+
+智能卡的好处
+------------
+
+智能卡包含一个加密芯片，能够存储私钥并直接在卡本身上执行加密操作。由于
+密钥内容永远不会离开智能卡，因此插入硬件设备的计算机的操作系统无法自行
+检索私钥。这与我们之前用于备份目的的加密 USB 存储设备有很大不同——当
+USB 设备插入并安装时，操作系统能够访问私钥内容。
+
+使用外部加密 USB 介质并不能替代具有智能卡功能的设备。
+
+可用的智能卡设备
+----------------
+
+除非你的所有笔记本电脑和工作站都有智能卡读卡器，否则最简单的方法是获
+取实现智能卡功能的专用 USB 设备。有多种选择：:
+
+- `Nitrokey Start`_: 开放硬件和免费软件，日本基于FSI的 `Gnuk` 。
+  少数支持 ED25519 ECC 密钥的商用设备之一，但提供的安全功能最少
+  （例如防篡改或某些旁路攻击）。
+- `Nitrokey Pro 2`_: 与 Nitrokey Start 类似，但更防篡改并提供
+  更多安全功能。Pro 2 支持 ECC 加密 (NISTP)。
+- `Yubikey 5`_: 专有硬件和软件，但比 Nitrokey Pro 便宜，并且以
+  USB-C 形式提供，对于较新的笔记本电脑更有用。提供额外的安全功能，
+  例如 FIDO U2F 等，现在终于支持 NISTP 和 ED25519 ECC 密钥。
+
+你的选择将取决于成本、你所在地理区域的货运便利性以及开放/专有硬件考虑
+因素。
+
+.. note::
+
+    如果你位列于 MAINTAINERS 中或在 kernel.org 上拥有帐户，则你有
+    资格获得Linux 基金会提供的_`qualify for a free Nitrokey Start` 。
+
+.. _`Nitrokey Start`: https://shop.nitrokey.com/shop/product/nitrokey-start-6
+.. _`Nitrokey Pro 2`: https://shop.nitrokey.com/shop/product/nkpr2-nitrokey-pro-2-3
+.. _`Yubikey 5`: https://www.yubico.com/products/yubikey-5-overview/
+.. _Gnuk: https://www.fsij.org/doc-gnuk/
+.. _`qualify for a free Nitrokey Start`: https://www.kernel.org/nitrokey-digital-tokens-for-kernel-developers.html
+
+配置你的智能卡设备
+------------------
+
+当你将智能卡设备插入任何现代 Linux 工作站时，它就应该可以正常工作
+(TM)。你可以通过运行来验证它::
+
+    $ gpg --card-status
+
+如果你看到完整的智能卡详细信息，那么你就可以开始了。不幸的是，对所有
+可能无法正常工作的原因进行故障排除超出了本指南的范围。如果你在使该卡
+与 GnuPG 配合使用时遇到问题，请通过常规支持渠道寻求帮助。
+
+要配置你的智能卡，你需要使用 GnuPG 菜单系统，因为没有方便的命令行开
+关::
+
+    $ gpg --card-edit
+    [...omitted...]
+    gpg/card> admin
+    Admin commands are allowed
+    gpg/card> passwd
+
+你应该设置用户 PIN (1)、管理员 PIN (3) 和重置代码 (4)。请确保将
+这些信息记录并存储在安全的地方，尤其是管理员 PIN 码和重置代码（它允
+许你完全擦除智能卡）。你很少需要使用管理员 PIN 码，如果你不记录它，
+你将不可避免地忘记它是什么。
+
+回到主卡菜单，你还可以设置其他值（例如姓名、性别、登录数据等），但这
+不是必需的，并且如果你丢失智能卡，还会泄露有关智能卡的信息。
+
+.. note::
+
+    尽管名称为“PIN”，但卡上的用户 PIN 和管理员 PIN 都不需要是数字。
+
+.. warning::
+
+    某些设备可能要求你将子密钥移至设备上，然后才能更改密码。请检查设
+    备制造商提供的文档。
+
+将子密钥移至你的智能卡
+----------------------
+
+退出卡菜单（使用“q”）并保存所有更改。接下来，让我们将子密钥移至智能卡
+上。对于大多数操作，你将需要 PGP 密钥密码和卡的管理员 PIN::
+
+    $ gpg --edit-key [fpr]
+
+    Secret subkeys are available.
+
+    pub  ed25519/AAAABBBBCCCCDDDD
+         created: 2022-12-20  expires: 2024-12-19  usage: SC
+         trust: ultimate      validity: ultimate
+    ssb  cv25519/1111222233334444
+         created: 2022-12-20  expires: never       usage: E
+    ssb  ed25519/5555666677778888
+         created: 2017-12-07  expires: never       usage: S
+    [ultimate] (1). Alice Dev <adev@kernel.org>
+
+    gpg>
+
+使用 ``--edit-key`` 使我们再次进入菜单模式，你会注意到按键列表有点
+不同。从现在开始，所有命令都在此菜单模式内完成，如 所示 ``gpg>``。
+
+首先，让我们选择要放入卡上的密钥 - 你可以通过键入 ``key 1`` （它是
+列表中的第一个， **[E]** 子密钥）来完成此操作：
+
+    gpg> key 1
+
+在输出中，你现在在 **[E]** 子密钥应该看到 ``ssb*`` 。意味着这个子
+密钥当前被选中。它用作切换键，这意味着如果你再次输入 ``key 1`` ，
+``*`` 将会消失并且该键将不再被选择。
+
+现在，让我们将该密钥移至智能卡上::
+
+    gpg> keytocard
+    Please select where to store the key:
+       (2) Encryption key
+    Your selection? 2
+
+由于它是我们的 **[E]** 密钥，因此将其放入加密槽中是有意义的。当你提
+交选择时，系统将首先提示你输入 PGP 密钥密码，然后输入管理员 PIN 码。
+如果命令返回且没有错误，则你的密钥已被移动。
+
+**重要提示**：现在再次键入 ``key 1`` 以取消选择第一个键，并 ``key 2``
+选择 **[S]** 密钥::
+
+    gpg> key 1
+    gpg> key 2
+    gpg> keytocard
+    Please select where to store the key:
+       (1) Signature key
+       (3) Authentication key
+    Your selection? 1
+
+你可以使用 **[S]** 密钥进行签名和身份验证，但我们希望确保它位于签名槽中，
+因此选择 (1)。跟之前一样，如果你的命令返回且没有错误，则操作成功::
+
+    gpg> q
+    Save changes? (y/N) y
+
+保存更改将删除你从主目录移动到卡上的密钥（但这没关系，因为我们还有备份，
+让我们需要替换智能卡时再次执行此操作）。
+
+验证密钥是否已移动
+~~~~~~~~~~~~~~~~~~
+
+如果你现在执行 ``--list-secret-keys`` ，你将看到输出中存在细微的差异::
+
+    $ gpg --list-secret-keys
+    sec#  ed25519 2022-12-20 [SC] [expires: 2024-12-19]
+          000000000000000000000000AAAABBBBCCCCDDDD
+    uid           [ultimate] Alice Dev <adev@kernel.org>
+    ssb>  cv25519 2022-12-20 [E] [expires: 2024-12-19]
+    ssb>  ed25519 2022-12-20 [S]
+
+在 ``ssb>``中的 ``>`` 输出意味着子密钥只能在智能卡上可用，如果你返回
+密钥目录并查看那里的内容，你会注意到 ``.key`` 那里的文件已被存根替换::
+
+    $ cd ~/.gnupg/private-keys-v1.d
+    $ strings *.key | grep 'private-key'
+
+输出应包含 ``shadowed-private-key`` 指示这些文件只是存根，实际内容
+位于智能卡上。
+
+验证智能卡是否正常工作
+~~~~~~~~~~~~~~~~~~~~~~
+
+要验证智能卡是否按预期工作，你可以创建签名::
+
+    $ echo "Hello world" | gpg --clearsign > /tmp/test.asc
+    $ gpg --verify /tmp/test.asc
+
+在你的第一条命令执行时，应该会询问你智能卡的PIN，然后在你运行
+``gpg --verify`` 后显示"Good signature"。
+
+恭喜，你已成功使窃取你的数字开发者身份变得极其困难！
+
+其他常见的 GnuPG 操作
+---------------------
+
+以下是你需要使用 PGP 密钥执行的一些常见操作的快速参考。
+
+安装你的安全离线存储
+~~~~~~~~~~~~~~~~~~~~
+
+你将需要你的证书密钥来执行以下任何操作，因此你首先需要安装备份离线存储
+并告诉 GnuPG 使用它::
+
+    $ export GNUPGHOME=/media/disk/foo/gnupg-backup
+    $ gpg --list-secret-keys
+
+你需要确保你看到 ``sec`` 而不是 ``sec#`` 在输出中（ ``#`` 意味着
+密钥不可用并且你仍在使用常规主目录位置）。
+
+延长密钥有效期
+~~~~~~~~~~~~~~
+
+证书密钥的默认到期日期为自创建之日起 2 年。这样做既是出于安全原因，也
+是为了使过时的密钥最终从密钥服务器中消失。
+
+要将密钥的有效期从当前日期延长一年，只需运行::
+
+    $ gpg --quick-set-expire [fpr] 1y
+
+如果更容易记住，你也可以使用特定日期（例如你的生日、1 月 1 日或加拿大
+国庆日）::
+
+    $ gpg --quick-set-expire [fpr] 2025-07-01
+
+请记住将更新后的密钥发送回密钥服务器::
+
+    $ gpg --send-key [fpr]
+
+进行任何更改后更新你的工作目录
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+使用离线存储对密钥进行任何更改后，你需要将这些更改导入回常规工作目录
+中::
+
+    $ gpg --export | gpg --homedir ~/.gnupg --import
+    $ unset GNUPGHOME
+
+通过 ssh 使用 gpg-agent
+~~~~~~~~~~~~~~~~~~~~~~~
+
+如果你需要在远程系统上签署标签或提交，你可以通过 ssh 转发你的
+gpg-agent。
+
+请参考 GnuPG wiki 上提供的说明:
+
+- `Agent通过SSH转发`_
+
+如果你可以修改远程端的 sshd 服务器设置，则工作会更顺利。
+
+.. _`Agent通过SSH转发`: https://wiki.gnupg.org/AgentForwarding
+
+将 PGP 与 Git 结合使用
+======================
+
+Git 的核心功能之一是它的分散性——一旦将仓库克隆到你的系统，你就拥有该
+项目的完整历史记录，包括其所有标签、提交和分支。然而，随着数百个克隆仓
+库的出现，人们如何验证他们的 linux.git 副本没有被恶意第三方篡改？
+
+或者，如果在代码中发现后门，并且提交中的“Author”行表示它是由你完成的，
+而你非常确定 `自己与它无关`_ ，会发生什么？
+
+为了解决这两个问题，Git 引入了 PGP 集成。签名的标签通过确保其内容与创
+建标签的开发人员的工作站上的内容完全相同来证明仓库的完整性，而签名的提
+交使其他人几乎不可能在无法访问你的 PGP 密钥的情况下冒充你。
+
+.. _`自己与它无关`: https://github.com/jayphelps/git-blame-someone-else
+
+配置 git 使用你的 PGP 密钥
+--------------------------
+
+如果你的密钥环中只有一个密钥，那么你实际上不需要执行任何额外操作，因为
+它会成为你的默认密钥。但是，如果你碰巧有多个密钥，你可以告诉 git 应该
+使用哪个密钥（``[fpr]`` 是你密钥的指纹）::
+
+    $ git config --global user.signingKey [fpr]
+
+如何使用签名标签
+----------------
+
+要创建签名标签，只需将 ``-s`` 开关传递给 tag 命令::
+
+    $ git tag -s [tagname]
+
+我们的建议是始终签署 git 标签，因为这可以让其他开发人员确保他们从中提
+取的 git 仓库没有被恶意更改。
+
+如何验证签名标签
+~~~~~~~~~~~~~~~~
+
+要验证签名标签，只需使用以下 ``verify-tag`` 命令::
+
+    $ git verify-tag [tagname]
+
+如果你从项目仓库的另一个分支中拉取标签，git 应该自动验证你拉取的顶
+部的签名，并在合并操作期间向你显示结果::
+
+    $ git pull [url] tags/sometag
+
+合并消息将包含如下内容::
+
+    Merge tag 'sometag' of [url]
+
+    [Tag message]
+
+    # gpg: Signature made [...]
+    # gpg: Good signature from [...]
+
+如果你正在验证其他人的 git 标签，那么你将需要导入他们的 PGP 密钥。
+请参阅下面的":ref:`身份验证`"部分。
+
+配置 git 始终对带注释的标签（annotated tags）进行签名annotated tags
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+如果你要创建带注释的标签，你很可能会想要对其进行签名。要强制 git 始终签
+署带注释的标签，你可以设置一个全局配置选项::
+
+    $ git config --global tag.forceSignAnnotated true
+
+如何使用签名的提交
+------------------
+
+创建签名提交很容易，但在 Linux 内核开发中使用它们要困难得多，因为它依赖
+于发送到邮件列表的补丁，并且此工作流程不保留 PGP 提交签名。此外，当重新
+调整仓库以匹配上游时，甚至你自己的 PGP 提交签名最终也会被丢弃。因此，大
+多数内核开发人员不会费心签署他们的提交，并且会忽略他们在工作中依赖的任何
+外部仓库中的签名提交。
+
+但是，如果你的工作 git 树在某些 git 托管服务（kernel.org、
+infradead.org、ozlabs.org 或其他）上公开可用，那么建议你签署所有 git
+提交，即使上游开发人员不直接受益于这种做法。
+
+我们推荐这样做的原因如下:
+
+1. 如果需要执行代码取证或跟踪代码来源，即使是外部维护的带有 PGP 提交签名
+   的树对于此类问题也很有价值。
+2. 如果你需要重新克隆本地仓库（例如，在磁盘故障后），这可以让你在恢复工
+   作之前轻松验证仓库的完整性。
+3. 如果有人需要挑选你的提交，这可以让他们在应用之前快速验证其完整性。
+
+创建签名提交
+~~~~~~~~~~~~
+
+要创建签名提交，你只需将 ``-S`` 标志传递给 ``git commit`` 命令（由于
+与另一个标志冲突，所以它是大写的 ``-S`` ）::
+
+    $ git commit -S
+
+配置 git 始终对提交进行签名
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+你可以告诉 git 总是签署提交::
+
+    git config --global commit.gpgSign true
+
+.. note::
+
+    确保 ``gpg-agent`` 在打开此功能之前进行配置。
+
+.. _身份验证:
+
+
+如何使用签名补丁
+----------------
+
+可以使用你的 PGP 密钥来签署发送到内核开发人员邮件列表的补丁。由于现有的
+电子邮件签名机制（PGP-Mime 或 PGP-inline）往往会导致常规代码审查任务
+出现问题，因此你应该使用为此创建的 kernel.org 工具，该工具将加密证明签
+名放入消息标头中（a-la DKIM）:
+
+- `Patatt Patch Attestation`_
+
+.. _`Patatt Patch Attestation`: https://pypi.org/project/patatt/
+
+安装和配置 patatt
+~~~~~~~~~~~~~~~~~
+
+Patatt 已针对许多发行版进行了打包，因此请先检查那里。你还可以使用
+“ ``pip install patatt`` ”从 pypi 安装它。
+
+如果你已经使用 git 配置了 PGP 密钥（通过``user.signingKey`` 配置参数），
+则 patatt 不需要进一步配置。你可以通过在所需的仓库中安装 git-send-email
+钩子来开始签署补丁::
+
+    patatt install-hook
+
+现在，你使用 ``git send-email`` 发送的任何补丁都将自动使用你的加密签
+名进行签名
+
+检查 patatt 签名
+~~~~~~~~~~~~~~~~
+
+如果你用于 ``b4`` 检索和应用补丁，那么它将自动尝试验证它遇到的所有
+DKIM 和 patatt 签名，例如::
+
+    $ b4 am 20220720205013.890942-1-broonie@kernel.org
+    [...]
+    Checking attestation on all messages, may take a moment...
+    ---
+      ✓ [PATCH v1 1/3] kselftest/arm64: Correct buffer allocation for SVE Z registers
+      ✓ [PATCH v1 2/3] arm64/sve: Document our actual ABI for clearing registers on syscall
+      ✓ [PATCH v1 3/3] kselftest/arm64: Enforce actual ABI for SVE syscalls
+      ---
+      ✓ Signed: openpgp/broonie@kernel.org
+      ✓ Signed: DKIM/kernel.org
+
+.. note::
+
+    Patatt 和 b4 仍在积极开发中，你应该检查这些项目的最新文档以了解任
+    何新功能或更新功能。
+
+如何验证内核开发者身份
+======================
+
+签署标签和提交很容易，但是如何验证用于签署某项内容的密钥是否属于实际的内
+核开发人员而不是恶意冒名顶替者？
+
+使用 WKD 和 DANE 配置auto-key-locate（自动密钥检索）
+----------------------------------------------------
+
+如果你还没有广泛收集其他开发人员的公钥，那么你可以依靠密钥自动发现和自动
+检索来快速启动你的密钥环。如果从头开始创建自己的信任 Web 的预期太令人畏
+惧， GnuPG 可以借助其他委托信任技术（即 DNSSEC 和 TLS）来帮助你继续前
+进。
+
+将以下内容添加到你的 ``~/.gnupg/gpg.conf``::
+
+    auto-key-locate wkd,dane,local
+    auto-key-retrieve
+
+基于 DNS 的命名实体身份验证（“DANE”）是一种在 DNS 中发布公钥并使用
+DNSSEC 签名区域保护它们的方法。Web 密钥目录（“WKD”）是使用 https
+查找来达到相同目的的替代方法。当使用 DANE 或 WKD 查找公钥时，GnuPG
+将分别验证 DNSSEC 或 TLS 证书，然后将自动检索的公钥添加到本地密钥环。
+
+Kernel.org 为所有拥有 kernel.org 帐户的开发人员发布 WKD。一旦你的
+``gpg.conf`` 中进行了上述更改，你就可以自动检索 Linus Torvalds 和
+Greg Kroah-Hartman 的密钥（如果你还没有它们）::
+
+    $ gpg --locate-keys torvalds@kernel.org gregkh@kernel.org
+
+如果你有 kernel.org 帐户，那么你应该 `添加 kernel.org UID 到你的密钥中`_
+添加到你的密钥中，以使 WKD 对其他内核开发人员更有用。
+
+.. _`添加 kernel.org UID 到你的密钥中`: https://korg.wiki.kernel.org/userdoc/mail#adding_a_kernelorg_uid_to_your_pgp_key
+
+信任网 (WOT) 与首次使用信任 (TOFU)
+-----------------------------------
+
+PGP 结合了称为“信任网”的信任委托机制。从本质上讲，这是一次尝试取代
+HTTPS/TLS 世界对集中式证书颁发机构的需求。PGP 将这一责任留给每个
+用户，而不是由各种软件制造商规定谁应该是你值得信赖的认证实体。
+
+不幸的是，很少有人了解信任网是如何运作的。虽然它仍然是 OpenPGP 规
+范的一个重要方面，但最新版本的 GnuPG（2.2 及更高版本）已经实现了
+一种称为“首次使用信任”(TOFU) 的替代机制。你可以将 TOFU 视为“类似
+SSH 的信任方法”。使用 SSH，第一次连接到远程系统时，其密钥指纹会被
+记录并记住。如果将来密钥发生变化，SSH 客户端将向你发出警报并拒绝连
+接，迫使你决定是否选择信任更改后的密钥。同样，第一次导入某人的 PGP
+密钥时，它被认为是有效的。如果将来的任何时候 GnuPG 遇到具有相同标
+识的另一个密钥，则先前导入的密钥和新密钥都将被标记为无效，你将需要手
+动确定保留哪一个。
+
+我们建议你使用 TOFU+PGP 组合信任模型（这是 GnuPG v2 中新默认的）。
+若要设置它，在 ``~/.gnupg/gpg.conf`` 中添加（或修改）
+``trust-model`` 设置::
+
+    trust-model tofu+pgp
+
+使用 kernel.org 信任网仓库
+--------------------------
+
+Kernel.org 维护着一个包含开发人员公钥的 git 仓库，作为复制密钥服
+务器网络的替代品，而在过去几年中，该网络几乎已经陷入黑暗。有关如何将
+该仓库设置为公钥来源的完整文档可以在此处找到:
+
+- `内核开发者密钥环`_
+
+如果你是内核开发人员，请考虑提交你的密钥以将其包含到该密钥环中。
+
+.. _`内核开发者密钥环`: https://korg.docs.kernel.org/pgpkeys.html
-- 
2.31.4


