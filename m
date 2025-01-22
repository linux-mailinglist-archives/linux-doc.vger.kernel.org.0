Return-Path: <linux-doc+bounces-35877-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C101EA18A1F
	for <lists+linux-doc@lfdr.de>; Wed, 22 Jan 2025 03:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 677F9188C521
	for <lists+linux-doc@lfdr.de>; Wed, 22 Jan 2025 02:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DD11487F6;
	Wed, 22 Jan 2025 02:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="OeWpTRuA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-m1973183.qiye.163.com (mail-m1973183.qiye.163.com [220.197.31.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE5C18E1F
	for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 02:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737513676; cv=none; b=c/vS5cU0S4vcwhWvAarhqgZJ9RwQoCGV2xhuje4D/7nCQssZQdaa3fjesMIwPm1X5HohQVXrsTgvus2vebHXEDEQN1eivGJRzkMO6o/wXRmisp3vPJgwo/6+gBQIBlEn73SIvyFPI9x9oesOlZchXlaeWy6jI2Xei6DpnZf1gqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737513676; c=relaxed/simple;
	bh=BBPWybhDk9YQlBRzFrLEG8wmKZPW6w+72EKTW7sV7nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIRb3XrpiDuva8+s9S8MFLt9b2yNdiWfSgOp+tffzdIx/OzBNmkxZg6tiYGF22OjIS6UggpD2vNeQa3D2f8+JTszI/0GB5ZGIZZ8snrCU+DPVpsatDJjtzm/Gh11I20I8w9nAh/jV8jiE/9HF+ub25UyhvNV0Skx4WhxIBN1jmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=OeWpTRuA; arc=none smtp.client-ip=220.197.31.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Received: from [192.168.6.2] (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 95b05daf;
	Wed, 22 Jan 2025 10:35:55 +0800 (GMT+08:00)
Message-ID: <6b47ce81-b339-47de-b482-c544df4061d2@cqsoftware.com.cn>
Date: Wed, 22 Jan 2025 10:35:56 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] docs/zh_CN: Add tpm tpm-security Chinese
 translation
To: Alex Shi <seakeel@gmail.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
 zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn>
 <3fd79c75add3f55a7dcd4cc2957b73795753a2ef.1737354981.git.zhaoshuo@cqsoftware.com.cn>
 <CAJy-Amm8xX215Mwi41nR87MRfP7phohCgxnG2_FGCK4c+8N4VQ@mail.gmail.com>
From: zhaoshuo <zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <CAJy-Amm8xX215Mwi41nR87MRfP7phohCgxnG2_FGCK4c+8N4VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSh9KVkNOTUpIHkIZSB9CS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a948bddca6509d0kunm95b05daf
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PBg6Fyo4DzISDikhMi80Ny06
	PTIwFD1VSlVKTEhMTkpISE5MSkJJVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUpJSEtLNwY+
DKIM-Signature:a=rsa-sha256;
	b=OeWpTRuAwQ6hhBQsWv/cC1ExbO8/d5ok0OOPNps0lQnRNblWujKBtgPbFg6RrE6oE8Cemef5VX0UJMrfhGjqg89i2l0RssgkmtoB00iCZYDKXAIgr3wrXShktzG0PHf8XGGBuMg01fZApd8z2nxUmOheYVLLRuYK+2p04apn124=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=vOEwKO3wiYwNAe852jK6To66sYo8OuredHdgPjN8VYA=;
	h=date:mime-version:subject:message-id:from;


在 2025/1/22 9:58, Alex Shi 写道:
> Shuo Zhao <zhaoshuo@cqsoftware.com.cn> 于2025年1月20日周一 21:40写道：
>> Translate .../security/tpm/tpm-security.rst into Chinese
>>
>> Update the translation through commit 3d2daf9d592e
>> ("Documentation: add tpm-security.rst")
>>
>> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>> ---
>>   .../translations/zh_CN/security/tpm/index.rst |   2 +-
>>   .../zh_CN/security/tpm/tpm-security.rst       | 151 ++++++++++++++++++
>>   2 files changed, 152 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm-security.rst
>>
>> diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
>> index f324bd4dd093..46cdf7c1a1c1 100644
>> --- a/Documentation/translations/zh_CN/security/tpm/index.rst
>> +++ b/Documentation/translations/zh_CN/security/tpm/index.rst
>> @@ -13,9 +13,9 @@
>>   .. toctree::
>>
>>      tpm_event_log
>> +   tpm-security
>>
>>   TODOLIST:
>> -*   tpm-security
>>   *   tpm_tis
>>   *   tpm_vtpm_proxy
>>   *   xen-tpmfront
>> diff --git a/Documentation/translations/zh_CN/security/tpm/tpm-security.rst b/Documentation/translations/zh_CN/security/tpm/tpm-security.rst
>> new file mode 100644
>> index 000000000000..a05947d8168c
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/security/tpm/tpm-security.rst
>> @@ -0,0 +1,151 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/security/tpm/tpm-security.rst
>> +
>> +:翻译:
>> + 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>> +
>> +TPM安全
>> +=======
>> +
>> +本文档的目的是描述我们如何使内核使用TPM在面对外部窥探和数据包篡改
>> +攻击（文献中称为被动和主动中间人攻击）时保持合理的稳健性。当前的
>> +安全文档适用于TPM2.0。
>> +
>> +介绍
>> +----
>> +
>> +TPM通常是一个通过某种低带宽总线连接到PC的独立芯片。虽然有一些
>> +例外，例如Intel PTT，它是运行在靠近CPU的软件环境中的软件TPM，
>> +受到不同类型的攻击，但目前大多数硬化的安全环境要求使用独立硬件
> “强化的” 安全环境？
>
> more and more AI translation works good for us now, give a better
> version than them,
> otherwise, this translation doc has no much sense.
>
> Thanks
> Alex

Ok,I will do it this way.

>
>> +TPM，这是本文讨论的使用场景。
>> +
>> +总线上的窥探和篡改攻击
>> +----------------------
>> +
>> +当前的技术状态允许使用 `TPM Genie`_ 硬件中间人，这是一种简单的外部设备，可以在
>> +任何系统或笔记本电脑上几秒钟内安装。最近成功演示了针对 `Windows Bitlocker TPM`_
>> +系统的攻击。最近同样的攻击针对 `基于TPM的Linux磁盘加密`_ 方案也遭到了同样的攻击。
>> +下一阶段的研究似乎是入侵总线上现有的设备以充当中间人，因此攻击者需要物理访问几
>> +秒钟的要求可能不再存在。然而，本文档的目标是尽可能在这种环境下保护TPM的机密性和
>> +完整性，并尝试确保即使我们不能防止攻击，至少可以检测到它。
>> +
>> +不幸的是，大多数TPM功能，包括硬件重置功能，都能被能够访问总线的攻击
>> +者控制，因此下面我们将讨论一些可能出现的干扰情况。
>> +
>> +测量（PCR）完整性
>> +-----------------
>> +
>> +由于攻击者可以向TPM发送自己的命令，他们可以发送任意的PCR扩展，从而破
>> +坏测量系统，这将是一种烦人的拒绝服务攻击。然而，针对密封到信任测量中
>> +的实体，有两类更严重的攻击。
>> +
>> +1. 攻击者可以拦截来自系统的所有PCR扩展，并完全替换为自己的值，产生
>> +   一个未篡改状态的重现，这会使PCR测量证明状态是可信的，并释放密钥。
>> +
>> +2. 攻击者可能会在某个时刻重置TPM，清除PCR，然后发送自己的测量，从而
>> +   有效地覆盖TPM已经完成的启动时间测量。
>> +
>> +第一种攻击可以通过始终对PCR扩展和读取命令进行HMAC保护来防止，这意味着
>> +如果没有在响应中产生可检测的HMAC失败，则测量值无法被替换。然而第二种
>> +攻击只能通过依赖某种机制来检测，这种机制会在TPM重置后发生变化。
>> +
>> +秘密保护
>> +--------
>> +
>> +某些进出TPM的信息,如密钥密封、私钥导入和随机数生成容易被拦截，而仅仅
>> +使用HMAC保护无法防止这种情况。因此，对于这些类型的命令，我们必须使用
>> +请求和响应加密来防止秘密信息的泄露。
>> +
>> +与TPM建立初始信任
>> +-----------------
>> +
>> +为了从一开始就提供安全性，必须建立一个初始的共享或非对称秘密，并且该
>> +秘钥必须对攻击者不可知。最明显的途径是使用背书和存储种子，这些可以用
>> +来派生非对称密钥。然而，使用这些密钥很困难，因为将它们传递给内核的唯
>> +一方法是通过命令行，这需要在启动系统中进行广泛的支持，而且无法保证任
>> +何一个层次不会有任何形式的授权。
>> +
>> +Linux内核选择的机制是从空种子使用标准的存储种子参数派生出主椭圆曲线
>> +密钥。空种子有两个优势：首先该层次物理上无法具有授权，因此我们始终可
>> +以使用它；其次空种子在TPM重置时会发生变化，这意味着如果我们在当天开始
>> +时基于空种子建立信任，则所有派生的密钥加盐的会话都将在TPM重置且种子发
> “加盐的会话” ？？ is there sth better??

This is indeed inappropriate. I'll make some modifications.



Thanks,

ZhaoShuo

>
>> +生变化时失败。
>> +
>> +显然，在没有任何其他共享秘密的情况下使用空种子，我们必须创建并读取初始
>> +公钥，这当然可能会被总线中间人拦截并替换。然而，TPM有一个密钥认证机制
>> +（使用EK背书证书，创建认证身份密钥，并用该密钥认证空种子主密钥），但由
>> +于它过于复杂，无法在内核中运行，因此我们保留空主密钥名称的副本，通过
>> +sysfs导出，以便用户空间在启动时进行完整的认证。这里的明确保证是，如果空
>> +主密钥认证成功，那么从当天开始的所有TPM交易都是安全的；如果认证失败，则
>> +说明系统上有中间人（并且任何在启动期间使用的秘密可能已被泄露）。
>> +
>> +信任堆叠
>> +--------
>> +
>> +在当前的空主密钥场景中，TPM必须在交给下一个使用者之前完全清除。然而，
>> +内核将派生出的空种子密钥的名称传递给用户空间，用户空间可以通过认证来
>> +验证该名称。因此，这种名称传递链也可以用于各个启动组件之间（通过未指
>> +定的机制）。例如grub可以使用空种子方案来实现安全性，并将名称交给内核。
>> +内核可以派生出密钥和名称，并确定如果它们与交接的版本不同，则表示发生
>> +了篡改。因此可以通过名称传递将任意启动组件（从UEFI到grub到内核）串联
>> +起来，只要每个后续组件知道如何收集该名称,并根据其派生的密钥进行验证。
>> +
>> +会话属性
>> +--------
>> +
>> +所有内核使用的TPM命令都允许会话。HMAC会话可用于检查请求和响应的完整性，
>> +而解密和加密标志可用于保护参数和响应。HMAC和加密密钥通常是从共享授权秘
>> +钥推导出来的，但对于许多内核操作来说，这些密钥是已知的（通常为空）。因
>> +此内核使用空主密钥作为盐密钥来创建每个HMAC会话，这样就为会话密钥的派生
>> +提供了加密输入。因此内核仅需创建一次空主密钥（作为一个易失的TPM句柄），
>> +并将其保存在tpm_chip中，用于每次在内核中使用TPM时。由于内核资源管理器缺
>> +乏去间隙化，当前每次操作都需要创建和销毁会话，但未来可能会将单个会话重用
>> +用于内核中的HMAC、加密和解密会话。
>> +
>> +保护类型
>> +--------
>> +
>> +对于每个内核操作，我们使用空主密钥加盐的HMAC来保护完整性。此外我们使用参数
>> +加密来保护密钥密封，并使用参数解密来保护密钥解封和随机数生成。
>> +
>> +空主密钥认证在用户空间的实现
>> +============================
>> +
>> +每个TPM都会附带几个X.509证书，通常用于主背书密钥。本文档假设存在椭圆曲线
>> +版本的证书，位于01C00002，但也同样适用于RSA证书(位于01C00001)。
>> +
>> +认证的第一步是使用 `TCG EK Credential Profile`_ 模板进行主密钥的创建，该
>> +模板允许将生成的主密钥与证书中的主密钥进行比较（公钥必须匹配）。需要注意
>> +的是，生成EK主密钥需要EK层级密码，但EC主密钥的预生成版本应位于81010002，
>> +并且可以无需密钥授权对其执行TPM2_ReadPublic()操作。接下来，证书本身必须
>> +经过验证，以确保其可以追溯到制造商根证书（该根证书应公开在制造商网站上）。
>> +完成此步骤后将在TPM内部生成一个认证密钥（AK），并使用TPM2_MakeCredential、
>> +AK的名称和EK公钥加密一个秘密。然后TPM执行TPM2_ActivateCredential，只有在
>> +TPM、EK和AK之间的绑定关系成立时，才能恢复秘密。现在，生成的AK可以用于对由
>> +内核导出的空主密钥进行认证。由于TPM2_MakeCredential/ActivateCredential操作
>> +相对复杂，下面将描述一种涉及外部生成私钥的简化过程。
>> +
>> +这个过程是通常基于隐私CA认证过程的简化缩写。假设此时认证由TPM所有者进行，
>> +所有者只能访问所有者层次。所有者创建一个外部公/私钥对（假设是椭圆曲线），
>> +并使用内部包装过程将私钥进行封装以便导入，该私钥被其父级由EC派生的存储主密
>> +钥保护。TPM2_Import()操作使用一个以EK主密钥为盐值的参数解密HMAC会话（这也不
>> +需要EK密钥授权），意味着内部封装密钥是加密参数，因此除非TPM拥有认证的EK，否
>> +则无法执行导入操作。如果该命令成功执行并且HMAC在返回时通过验证，我们就知道
>> +我们有一个只为认证TPM加载的私钥副本。现在该密钥已加载到TPM中，并且存储主密
>> +钥已被清除（以释放空间用于生成空密钥）。
>> +
>> +现在根据 `TCG TPM v2.0 Provisioning Guidance`_ 中的存储配置生成空EC主密钥；
>> +该密钥的名称（即公钥区域的哈希值）被计算出来并与内核在/sys/class/tpm/tpm0/null_name
>> +中提供的空种子名称进行比较。如果名称不匹配，TPM就被认为是受损的。如果名称匹配，
>> +用户执行TPM2_Certify()，使用空主密钥作为对象句柄，使用加载的私钥作为签名句柄，
>> +并提供随机的合格数据。返回的certifyInfo的签名将与加载的私钥的公钥部分进行验证，
>> +并检查合格数据以防止重放。如果所有测试都通过，用户就可以确信TPM的完整性和隐私
>> +性在整个内核启动过程中得到了保护。
>> +
>> +.. _TPM Genie: https://www.nccgroup.trust/globalassets/about-us/us/documents/tpm-genie.pdf
>> +.. _Windows Bitlocker TPM: https://dolosgroup.io/blog/2021/7/9/from-stolen-laptop-to-inside-the-company-network
>> +.. _基于TPM的Linux磁盘加密: https://www.secura.com/blog/tpm-sniffing-attacks-against-non-bitlocker-targets
>> +.. _TCG EK Credential Profile: https://trustedcomputinggroup.org/resource/tcg-ek-credential-profile-for-tpm-family-2-0/
>> +.. _TCG TPM v2.0 Provisioning Guidance: https://trustedcomputinggroup.org/resource/tcg-tpm-v2-0-provisioning-guidance/
>> --
>> 2.47.1
>>

