Return-Path: <linux-doc+bounces-34328-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51811A05309
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jan 2025 07:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4BFB1886C2C
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jan 2025 06:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD5C38389;
	Wed,  8 Jan 2025 06:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="cqfEbxaP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-m3279.qiye.163.com (mail-m3279.qiye.163.com [220.197.32.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEDB2B9B9
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 06:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736316303; cv=none; b=lrkg9N35YkfVkZ8MYUbd7ZeBSB+nOEcDNVk7gpBbKMZikHrNXxLkYIy9YRk+L9w1cGdyfj9zhscMcX2CtEhss60TN+Ftz3kQG87GquVXFaUksdFUb9OA62Yp+jHz5+6V9IBM1AxQAmuQSyYEnXc3SMYfi2sjWvQLXN+1jNL3p/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736316303; c=relaxed/simple;
	bh=zbI9axxio6HWt+f/7GaW+ioi8wzfVsZEfJGktuBtXgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dugfqPCD9QYCnpJHPvVDj5li1spS6yTGKRYpkgHwujeoF6y3VOxn/hjEaDYC68uFzA64lXC8tE4GLHtexvolPjI2na+MsCz7fPx+HogUEYCQfAZ7NLxAykUwrpb18BbKOdxWOYy7lrK2LhmcxIorK2OfWyyCACO+F+iEYM7tjfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=cqfEbxaP; arc=none smtp.client-ip=220.197.32.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Received: from localhost.localdomain (unknown [171.8.192.198])
	by smtp.qiye.163.com (Hmail) with ESMTP id 8135dffb;
	Wed, 8 Jan 2025 14:04:54 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH v3] docs/zh_CN: Add siphash index Chinese translation
Date: Wed,  8 Jan 2025 14:04:47 +0800
Message-ID: <0af3d9b8be0e5166f74bd36fd6b040767f767fce.1736315479.git.zhangwei@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH05LVhhDQhgaTEpPTxodT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKTEpVQ1VKQklVSkJDWVdZFhoPEhUdFFlBWU9LSFVKS0hKT0hMVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a944484144503abkunm8135dffb
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nhw6Ogw*SzISMRdLODcXKAJD
	ITMaCgFVSlVKTEhNSEpNSUJOSUJIVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSkxKVUNVSkJJVUpCQ1lXWQgBWUFCSUxNNwY+
DKIM-Signature:a=rsa-sha256;
	b=cqfEbxaPADastUbgyVKFUIeEje2Ije4kZ4/oLNYp0T5TlsFs3PbnDk4fgvDlUDkMMGt/xBYwMRBkT87Rk9j82jdNX7MGGBfjsj2vfiOCFW3vqELp3TD+eqgXx3l6gjtbWdIoiU4026nmnss/TR/rl4iUFP9heuCbcHHL7T2Jle4=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=J3Q76MPdRobapxO1I3/Ld4UOc/S8mh7KBKb81eusvDk=;
	h=date:mime-version:subject:message-id:from;

Translate lwn/Documentation/security/siphash.rst into Chinese

Update the translation through commit 12fe434314c8
("Documentation: siphash: Fix typo in the name of offsetofend macro")

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
---

v3:

Change the email address of Yanteng Si

v2:

Change the "生成钥匙" to the "生成密钥"
Complete the commit tag
 
 .../translations/zh_CN/security/index.rst     |   2 +-
 .../translations/zh_CN/security/siphash.rst   | 195 ++++++++++++++++++
 2 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/siphash.rst

diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
index c73cd289ac3e..ceb700fe4561 100644
--- a/Documentation/translations/zh_CN/security/index.rst
+++ b/Documentation/translations/zh_CN/security/index.rst
@@ -16,6 +16,7 @@
    :maxdepth: 1
 
    lsm
+   siphash
    digsig
 
 TODOLIST:
@@ -27,7 +28,6 @@ TODOLIST:
 * sak
 * SCTP
 * self-protection
-* siphash
 * tpm/index
 * landlock
 * secrets/index
diff --git a/Documentation/translations/zh_CN/security/siphash.rst b/Documentation/translations/zh_CN/security/siphash.rst
new file mode 100644
index 000000000000..26dd8be699b3
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/siphash.rst
@@ -0,0 +1,195 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+:Original: Documentation/security/siphash.rst
+
+:翻译:
+
+ 张巍 zhangwei <zhangwei@cqsoftware.com.cn>
+
+=====================================
+SipHash - 一种短输入伪随机函数（PRF）
+=====================================
+
+：作者: Jason A.Donenfeld <jason@zx2c4.com>
+
+SipHash是一种加密安全的伪随机函数，即一种用于生成伪随机密钥的哈
+希函数，因为其在处理短输入时表现出色，因此得名。其由密码学家
+Daniel J. Bernstein和Jean-Philippe Aumasson设计。目的主要是替
+代其他哈希函数，例如：jhash，md5_transform，sha1_transform等。
+
+SipHash采用一个完全由随机数生成的密钥，以及一个输入缓冲区或者
+多个输入整数，它输出一个与随机数难以区分的整数，你可以将它作
+为安全序列、安全cookies的一部分，或者对其进行掩码处理，以便在
+哈希表中使用。
+
+生成密钥
+========
+
+密钥应来源于加密安全的随机数生成，要么使用get random bytes
+要么使用get random once::
+
+        siphash_key_t key;
+        get_random_bytes(&key, sizeof(key));
+
+如果你的密钥来源不是这两个，那么你的做法是错的。
+
+使用函数
+========
+
+这个函数有两个变种，一种是接受整数列表，另一种是接受缓冲区::
+
+        u64 siphash(const void *data, size_t len, const siphash_key_t *key);
+
+和::
+
+        u64 siphash_1u64(u64, const siphash_key_t *key);
+        u64 siphash_2u64(u64, u64, const siphash_key_t *key);
+        u64 siphash_3u64(u64, u64, u64, const siphash_key_t *key);
+        u64 siphash_4u64(u64, u64, u64, u64, const siphash_key_t *key);
+        u64 siphash_1u32(u32, const siphash_key_t *key);
+        u64 siphash_2u32(u32, u32, const siphash_key_t *key);
+        u64 siphash_3u32(u32, u32, u32, const siphash_key_t *key);
+        u64 siphash_4u32(u32, u32, u32, u32, const siphash_key_t *key);
+
+如果向一个通用的hsiphash函数传递一个恒定长度的常量，他将
+在编译的时候将常量折叠，并自动选择一个优化后的函数。
+
+哈希表键函数的用法::
+
+        struct some_hashtable {
+                DECLARE_HASHTABLE(hashtable, 8);
+                siphash_key_t key;
+        };
+
+        void init_hashtable(struct some_hashtable *table)
+        {
+                get_random_bytes(&table->key, sizeof(table->key));
+        }
+
+        static inline hlist_head *some_hashtable_bucket(struct some_hashtable *table, struct interesting_input *input)
+        {
+                return &table->hashtable[siphash(input, sizeof(*input), &table->key) & (HASH_SIZE(table->hashtable) - 1)];
+        }
+
+然后，你可以像往常一样对返回的哈希存储桶进行迭代。
+
+安全性
+======
+
+SipHash有着非常高的安全性,因为其有128位的密钥。只要密钥是保密的，
+即使攻击者看到多个输出，也无法猜测出函数的正确输出，因为2^128次
+方个输出是非常庞大的。
+
+Linux实现了SipHash的“2-4”变体
+
+Struct-passing陷阱
+==================
+
+通常情况下，XuY函数的输出长度不够大，因此你可能需要传递一个预填充
+的结构体给SipHash，在这样做时，务必确保结构体没有填充空隙，最简单
+的方法就是将结构体的成员按照大小降序的方式排序，并且使用offsetofend()
+函数代替sizeof()来获取结构体大小，出于性能的考虑，如果可以的话，最
+好将结构体按右边界对齐，示例如下::
+
+        const struct {
+                struct in6_addr saddr;
+                u32 counter;
+                u16 dport;
+        } __aligned(SIPHASH_ALIGNMENT) combined = {
+                .saddr = *(struct in6_addr *)saddr,
+                .counter = counter,
+                .dport = dport
+        };
+        u64 h = siphash(&combined, offsetofend(typeof(combined), dport), &secret);
+
+资源
+====
+
+如果你有兴趣了解更多信息，请阅读SipHash论文:
+https://131002.net/siphash/siphash.pdf
+
+-------------------------------------------------------------------------------
+
+===========================================
+HalfSipHash 是 SipHash 的一个较不安全的变种
+===========================================
+
+：作者: Jason A.Donenfeld <jason@zx2c4.com>
+
+如果你认为SipHash的速度不够快，无法满足你的需求，那么你可以
+使用HalfSipHash，这是一种令人担忧但是有用的选择。HalfSipHash
+将SipHash的轮数从“2-4”降低到“1-3”，更令人担心的是，它使用一
+个容易被穷举攻击的64位密钥(输出为32位)，而不是SipHash的128位
+密钥，不过，这对于要求高性能“jhash”用户来说这是比较好的选择。
+
+HalfSipHash是通过 "hsiphash" 系列函数提供的。
+
+.. warning::
+   绝对不要在作为哈希表键函数之外使用hsiphash函数，只有在你
+   能完全能确定输出永远不会从内核传输出去的情况下才能使用，
+   作为缓解哈希表泛洪拒绝服务攻击的一种手段，它仅在某些情况
+   下比jhash好用。
+
+在64位的内核中，hsiphash函数实际上实现的是SipHash-1-3，这是一
+种减少轮数的SipHash变形，而不是HalfSipHash-1-3。这是因为在64位
+代码中SipHash-1-3的性能与HalfSipHash-1-3相当，甚至可能更快，请
+注意，这并不意味这在64位的内核中，hsihpash函数与siphash函数相
+同，也不意味着他们是安全的；hsihash函数仍然使用一种不太安全的
+减少轮数的算法，并将输出截断为32位。
+
+生成哈希密钥
+============
+
+密钥应始终来源于加密安全的随机数生成，要么使用get random bytes
+要么使用get random once::
+
+        hsiphash_key_t key;
+        get_random_bytes(&key, sizeof(key));
+
+如果你的钥匙来源不是这两个，那么你的做法是错的。
+
+使用哈希函数
+============
+
+这个函数有两种变体，一个是接受整数列表，另一种是接受缓冲区::
+
+        u32 hsiphash(const void *data, size_t len, const hsiphash_key_t *key);
+
+和::
+
+        u32 hsiphash_1u32(u32, const hsiphash_key_t *key);
+        u32 hsiphash_2u32(u32, u32, const hsiphash_key_t *key);
+        u32 hsiphash_3u32(u32, u32, u32, const hsiphash_key_t *key);
+        u32 hsiphash_4u32(u32, u32, u32, u32, const hsiphash_key_t *key);
+
+如果向一个通用的hsiphash函数传递一个恒定长度的常量，他将在编译
+的时候将常量折叠，并自动选择一个优化后的函数。
+
+哈希表键函数的用法
+==================
+
+::
+
+        struct some_hashtable {
+                DECLARE_HASHTABLE(hashtable, 8);
+                hsiphash_key_t key;
+        };
+
+        void init_hashtable(struct some_hashtable *table)
+        {
+                get_random_bytes(&table->key, sizeof(table->key));
+        }
+
+        static inline hlist_head *some_hashtable_bucket(struct some_hashtable *table, struct interesting_input *input)
+        {
+                return &table->hashtable[hsiphash(input, sizeof(*input), &table->key) & (HASH_SIZE(table->hashtable) - 1)];
+        }
+
+然后，你可以像往常一样对返回的哈希存储桶进行迭代。
+
+性能
+====
+
+hsiphash()大约比jhash()慢三倍，这是因为有许多替换，不过这些都不是问题，
+因为哈希表查找不是瓶颈。而且，这些牺牲是为了hsiphash()的安全性和DoS抗
+性，这是值得的。
-- 
2.47.1


