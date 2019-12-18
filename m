Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAD6124278
	for <lists+linux-doc@lfdr.de>; Wed, 18 Dec 2019 10:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfLRJLC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Dec 2019 04:11:02 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:38388 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725930AbfLRJLC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Dec 2019 04:11:02 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04427;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0TlGDtfN_1576660249;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TlGDtfN_1576660249)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 18 Dec 2019 17:10:49 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] docs/zh_CN: embargoed hardware issues
Date:   Wed, 18 Dec 2019 17:10:40 +0800
Message-Id: <1576660243-84140-1-git-send-email-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate the embardgoed hardware issues to Chinese.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 .../zh_CN/process/embargoed-hardware-issues.rst    | 223 +++++++++++++++++++++
 1 file changed, 223 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/process/embargoed-hardware-issues.rst

diff --git a/Documentation/translations/zh_CN/process/embargoed-hardware-issues.rst b/Documentation/translations/zh_CN/process/embargoed-hardware-issues.rst
new file mode 100644
index 000000000000..5bc583a41188
--- /dev/null
+++ b/Documentation/translations/zh_CN/process/embargoed-hardware-issues.rst
@@ -0,0 +1,223 @@
+被限制的硬件问题
+================
+
+范围
+----
+
+导致安全问题的硬件问题与只影响Linux内核的纯软件错误是不同的安全错误类别。
+
+必须区别对待诸如熔毁(Meltdown)、Spectre、L1TF等硬件问题，因为它们通常会影响
+所有操作系统（“OS”），因此需要在不同的OS供应商、发行版、硬件供应商和其他各方
+之间进行协调。对于某些问题，软件缓解可能依赖于微码或固件更新，这需要进一步的
+协调。
+
+.. _zh_Contact:
+
+接触
+----
+
+Linux内核硬件安全小组独立于普通的Linux内核安全小组。
+
+该小组只负责协调被限制的硬件安全问题。Linux内核中纯软件安全漏洞的报告不由该
+小组处理，报告者将被引导至常规Linux内核安全小组(:ref:`Documentation/admin-guide/
+<securitybugs>`)联系。
+
+可以通过电子邮件 <hardware-security@kernel.org> 与小组联系。这是一份私密的安全
+官名单，他们将帮助您根据我们的文档化流程协调问题。
+
+邮件列表是加密的，发送到列表的电子邮件可以通过PGP或S/MIME加密，并且必须使用报告
+者的PGP密钥或S/MIME证书签名。该列表的PGP密钥和S/MIME证书可从
+https://www.kernel.org/.... 获得。
+
+虽然硬件安全问题通常由受影响的硬件供应商处理，但我们欢迎发现潜在硬件缺陷的研究
+人员或个人与我们联系。
+
+硬件安全官
+^^^^^^^^^^
+
+目前的硬件安全官小组:
+
+  - Linus Torvalds（Linux基金会院士）
+  - Greg Kroah Hartman（Linux基金会院士）
+  - Thomas Gleixner（Linux基金会院士）
+
+邮件列表的操作
+^^^^^^^^^^^^^^
+
+处理流程中使用的加密邮件列表托管在Linux Foundation的IT基础设施上。通过提供这项
+服务，Linux基金会的IT基础设施安全总监在技术上有能力访问被限制的信息，但根据他
+的雇佣合同，他必须保密。Linux基金会的IT基础设施安全总监还负责 kernel.org 基础
+设施。
+
+Linux基金会目前的IT基础设施安全总监是 Konstantin Ryabitsev。
+
+保密协议
+--------
+
+Linux内核硬件安全小组不是正式的机构，因此无法签订任何保密协议。核心社区意识到
+这些问题的敏感性，并提供了一份谅解备忘录。
+
+谅解备忘录
+----------
+
+Linux内核社区深刻理解在不同操作系统供应商、发行商、硬件供应商和其他各方之间
+进行协调时，保持硬件安全问题处于限制状态的要求。
+
+Linux内核社区在过去已经成功地处理了硬件安全问题，并且有必要的机制允许在限制
+限制下进行符合社区的开发。
+
+Linux内核社区有一个专门的硬件安全小组负责初始联系，并监督在限制规则下处理
+此类问题的过程。
+
+硬件安全小组确定开发人员（领域专家），他们将组成特定问题的初始响应小组。最初
+的响应小组可以引入更多的开发人员（领域专家）以最佳的技术方式解决这个问题。
+
+所有相关开发商承诺遵守限制规定，并对收到的信息保密。违反承诺将导致立即从当前
+问题中排除，并从所有相关邮件列表中删除。此外，硬件安全小组还将把违反者排除在
+未来的问题之外。这一后果的影响在我们社区是一种非常有效的威慑。如果发生违规
+情况，硬件安全小组将立即通知相关方。如果您或任何人发现潜在的违规行为，请立即
+向硬件安全人员报告。
+
+流程
+^^^^
+
+由于Linux内核开发的全球分布式特性，面对面的会议几乎不可能解决硬件安全问题。
+由于时区和其他因素，电话会议很难协调，只能在绝对必要时使用。加密电子邮件已被
+证明是解决此类问题的最有效和最安全的通信方法。
+
+开始披露
+""""""""
+
+披露内容首先通过电子邮件联系Linux内核硬件安全小组。此初始联系人应包含问题的
+描述和任何已知受影响硬件的列表。如果您的组织制造或分发受影响的硬件，我们建议
+您也考虑哪些其他硬件可能会受到影响。
+
+硬件安全小组将提供一个特定于事件的加密邮件列表，用于与报告者进行初步讨论、
+进一步披露和协调。
+
+硬件安全小组将向披露方提供一份开发人员（领域专家）名单，在与开发人员确认他们
+将遵守本谅解备忘录和文件化流程后，应首先告知开发人员有关该问题的信息。这些开发
+人员组成初始响应小组，并在初始接触后负责处理问题。硬件安全小组支持响应小组，
+但不一定参与缓解开发过程。
+
+虽然个别开发人员可能通过其雇主受到保密协议的保护，但他们不能以Linux内核开发
+人员的身份签订个别保密协议。但是，他们将同意遵守这一书面程序和谅解备忘录。
+
+披露方应提供已经或应该被告知该问题的所有其他实体的联系人名单。这有几个目的:
+
+  - 披露的实体列表允许跨行业通信，例如其他操作系统供应商、硬件供应商等。
+
+  - 可联系已披露的实体，指定应参与缓解措施开发的专家。
+
+  - 如果需要处理某一问题的专家受雇于某一上市实体或某一上市实体的成员，则响应
+    小组可要求该实体披露该专家。这确保专家也是实体反应小组的一部分。
+
+披露
+""""
+
+披露方通过特定的加密邮件列表向初始响应小组提供详细信息。
+
+根据我们的经验，这些问题的技术文档通常是一个足够的起点，最好通过电子邮件进行
+进一步的技术澄清。
+
+缓解开发
+""""""""
+
+初始响应小组设置加密邮件列表，或在适当的情况下重新修改现有邮件列表。
+
+使用邮件列表接近于正常的Linux开发过程，并且在过去已经成功地用于为各种硬件安全
+问题开发缓解措施。
+
+邮件列表的操作方式与正常的Linux开发相同。发布、讨论和审查修补程序，如果同意，
+则应用于非公共git存储库，参与开发人员只能通过安全连接访问该存储库。存储库包含
+针对主线内核的主开发分支，并根据需要为稳定的内核版本提供向后移植分支。
+
+最初的响应小组将根据需要从Linux内核开发人员社区中确定更多的专家。引进专家可以
+在开发过程中的任何时候发生，需要及时处理。
+
+如果专家受雇于披露方提供的披露清单上的实体或其成员，则相关实体将要求其参与。
+
+否则，披露方将被告知专家参与的情况。谅解备忘录涵盖了专家，要求披露方确认参与。
+如果披露方有令人信服的理由提出异议，则必须在五个工作日内提出异议，并立即与事件
+小组解决。如果披露方在五个工作日内未作出回应，则视为默许。
+
+在确认或解决异议后，专家由事件小组披露，并进入开发过程。
+
+协调发布
+""""""""
+
+有关各方将协商限制结束的日期和时间。此时，准备好的缓解措施集成到相关的内核树中
+并发布。
+
+虽然我们理解硬件安全问题需要协调限制时间，但限制时间应限制在所有有关各方制定、
+测试和准备缓解措施所需的最短时间内。人为地延长限制时间以满足会议讨论日期或其他
+非技术原因，会给相关的开发人员和响应小组带来了更多的工作和负担，因为补丁需要
+保持最新，以便跟踪正在进行的上游内核开发，这可能会造成冲突的更改。
+
+CVE分配
+"""""""
+
+硬件安全小组和初始响应小组都不分配CVE，开发过程也不需要CVE。如果CVE是由披露方
+提供的，则可用于文档中。
+
+流程专使
+--------
+
+为了协助这一进程，我们在各组织设立了专使，他们可以回答有关报告流程和进一步处理
+的问题或提供指导。专使不参与特定问题的披露，除非响应小组或相关披露方提出要求。
+现任专使名单:
+
+  ============= ========================================================
+  ARM
+  AMD		Tom Lendacky <tom.lendacky@amd.com>
+  IBM
+  Intel		Tony Luck <tony.luck@intel.com>
+  Qualcomm	Trilok Soni <tsoni@codeaurora.org>
+
+  Microsoft	Sasha Levin <sashal@kernel.org>
+  VMware
+  Xen		Andrew Cooper <andrew.cooper3@citrix.com>
+
+  Canonical	Tyler Hicks <tyhicks@canonical.com>
+  Debian	Ben Hutchings <ben@decadent.org.uk>
+  Oracle	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
+  Red Hat	Josh Poimboeuf <jpoimboe@redhat.com>
+  SUSE		Jiri Kosina <jkosina@suse.cz>
+
+  Amazon
+  Google	Kees Cook <keescook@chromium.org>
+  ============= ========================================================
+
+如果要将您的组织添加到专使名单中，请与硬件安全小组联系。被提名的专使必须完全
+理解和支持我们的过程，并且在Linux内核社区中很容易联系。
+
+加密邮件列表
+------------
+
+我们使用加密邮件列表进行通信。这些列表的工作原理是，发送到列表的电子邮件使用
+列表的PGP密钥或列表的/MIME证书进行加密。邮件列表软件对电子邮件进行解密，并
+使用订阅者的PGP密钥或S/MIME证书为每个订阅者分别对其进行重新加密。有关邮件列表
+软件和用于确保列表安全和数据保护的设置的详细信息，请访问:
+https://www.kernel.org/....
+
+关键点
+^^^^^^
+
+初次接触见 :ref:`zh_Contact`. 对于特定于事件的邮件列表，密钥和S/MIME证书通过
+特定列表发送的电子邮件传递给订阅者。
+
+订阅事件特定列表
+^^^^^^^^^^^^^^^^
+
+订阅由响应小组处理。希望参与通信的披露方将潜在订户的列表发送给响应组，以便
+响应组可以验证订阅请求。
+
+每个订户都需要通过电子邮件向响应小组发送订阅请求。电子邮件必须使用订阅服务器
+的PGP密钥或S/MIME证书签名。如果使用PGP密钥，则必须从公钥服务器获得该密钥，
+并且理想情况下该密钥连接到Linux内核的PGP信任网。另请参见:
+https://www.kernel.org/signature.html.
+
+响应小组验证订阅者，并将订阅者添加到列表中。订阅后，订阅者将收到来自邮件列表
+的电子邮件，该邮件列表使用列表的PGP密钥或列表的/MIME证书签名。订阅者的电子邮件
+客户端可以从签名中提取PGP密钥或S/MIME证书，以便订阅者可以向列表发送加密电子
+邮件。
-- 
1.8.3.1

