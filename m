Return-Path: <linux-doc+bounces-33817-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8D29FF6A7
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jan 2025 08:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DEF91881DE9
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jan 2025 07:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278DF179A3;
	Thu,  2 Jan 2025 07:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H7UbjqCj"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE727462
	for <linux-doc@vger.kernel.org>; Thu,  2 Jan 2025 07:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735804336; cv=none; b=h/McNO/TNSCMYEma68C8IB8iO/69ahX84xVOauIDuuL/QFrjIjqNI41+DJK/eDMcyofsFEokR/WdTTFTKgGADUQ6CQHsBW3RlvgnKxKGXqbEYMvjTi3Vg5NrzcSkiFhSO2rCPLPyE8TUxKIFCEIQbalYHhF8lafwiB73sQGkRsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735804336; c=relaxed/simple;
	bh=xm/JdA3N2Ak4v1L5WQaoVyKdPklE20PHztadT/Zs9i8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJADwiyKUlrW5lWH4JEeJHWFG5HbEl3nPITrq02ea8YetVgY235OfJDp3Mmgzdows/xJ6GU419Fte20PtgIHHvsmSbNx43UB9jrK1gKJQU5FUCMmO18W3cV0yhbo9GoOqWq9j0ZhnlmS7G8NqDKeNJqZYPBvwyH7M1/4SokREBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H7UbjqCj; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <eef0f708-ae72-44eb-a1f5-8cdaceec081f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735804331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FIyQkKkqxX8fKg9y5FM7CfXB4EBXvl3PbRDyknPRNmc=;
	b=H7UbjqCj+VGR0yviKRcJUTFgKITzbJrO3R7+Y/WAiCY9V22uF1gqsb8LfmF9I4ksBl5N69
	FZIiRgS01Wady+Ud/7PTY5CwIgHtm01oq5Q8zncQBIm7ZTlT9ykyGIeGnGoV+UH511398u
	b+uUX2cPgBspZcrOgagOHaus9ADKGPI=
Date: Thu, 2 Jan 2025 15:52:05 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: Add siphash index Chinese translation
To: zhangwei <zhangwei@cqsoftware.com.cn>, alexs@kernel.org, corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 linux-doc@vger.kernel.org
References: <20241227091719.9054-1-zhangwei@cqsoftware.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20241227091719.9054-1-zhangwei@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi ZhangWei,


在 2024/12/27 17:17, zhangwei 写道:
> Translate lwn/Documentation/security/siphash.rst into Chinese
>
> Update the translation through commit "92b3d24de890"
>
> Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
> ---
>   .../translations/zh_CN/security/index.rst     |   2 +-
>   .../translations/zh_CN/security/siphash.rst   | 195 ++++++++++++++++++
>   2 files changed, 196 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/security/siphash.rst
>
> diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
> index c73cd289ac3e..ceb700fe4561 100644
> --- a/Documentation/translations/zh_CN/security/index.rst
> +++ b/Documentation/translations/zh_CN/security/index.rst
> @@ -16,6 +16,7 @@
>      :maxdepth: 1
>   
>      lsm
> +   siphash
>      digsig
>   
>   TODOLIST:
> @@ -27,7 +28,6 @@ TODOLIST:
>   * sak
>   * SCTP
>   * self-protection
> -* siphash
>   * tpm/index
>   * landlock
>   * secrets/index
> diff --git a/Documentation/translations/zh_CN/security/siphash.rst b/Documentation/translations/zh_CN/security/siphash.rst
> new file mode 100644
> index 000000000000..94c9dd4362e0
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/security/siphash.rst
> @@ -0,0 +1,195 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +:Original: Documentation/security/siphash.rst
> +
> +:翻译:
> +
> + 张巍 zhangwei <zhangwei@cqsoftware.com.cn>
> +
> +=====================================
> +SipHash - 一种短输入伪随机函数（PRF）
> +=====================================
> +
> +：作者: Jason A.Donenfeld <jason@zx2c4.com>
> +
> +SipHash是一种加密安全的伪随机函数，即一种用于生成伪随机密钥的哈
> +希函数，因为其在处理短输入时表现出色，因此得名。其由密码学家
> +Daniel J. Bernstein和Jean-Philippe Aumasson设计。目的主要是替
> +代其他哈希函数，例如：jhash，md5_transform，sha1_transform等。
> +
> +SipHash采用一个完全由随机数生成的密钥，以及一个输入缓冲区或者
> +多个输入整数，它输出一个与随机数难以区分的整数，你可以将它作
> +为安全序列、安全cookies的一部分，或者对其进行掩码处理，以便在
> +哈希表中使用。
> +
> +生成钥匙
how about:
生成密钥

because you translate key as 密钥 in the after content.
> +========
> +
> +密钥应来源于加密安全的随机数生成，要么使用get random bytes
> +要么使用get random once::
> +
> +        siphash_key_t key;
> +        get_random_bytes(&key, sizeof(key));
> +
> +如果你的密钥来源不是这两个，那么你的做法是错的。
> +
> +使用函数
> +========
> +
> +这个函数有两个变种，一种是接受整数列表，另一种是接受缓冲区::
> +
> +        u64 siphash(const void *data, size_t len, const siphash_key_t *key);
> +
> +和::
> +
> +        u64 siphash_1u64(u64, const siphash_key_t *key);
> +        u64 siphash_2u64(u64, u64, const siphash_key_t *key);
> +        u64 siphash_3u64(u64, u64, u64, const siphash_key_t *key);
> +        u64 siphash_4u64(u64, u64, u64, u64, const siphash_key_t *key);
> +        u64 siphash_1u32(u32, const siphash_key_t *key);
> +        u64 siphash_2u32(u32, u32, const siphash_key_t *key);
> +        u64 siphash_3u32(u32, u32, u32, const siphash_key_t *key);
> +        u64 siphash_4u32(u32, u32, u32, u32, const siphash_key_t *key);
> +
> +如果向一个通用的hsiphash函数传递一个恒定长度的常量，他将
> +在编译的时候将常量折叠，并自动选择一个优化后的函数。
> +
> +哈希表键函数的用法::
> +
> +        struct some_hashtable {
> +                DECLARE_HASHTABLE(hashtable, 8);
> +                siphash_key_t key;
> +        };
> +
> +        void init_hashtable(struct some_hashtable *table)
> +        {
> +                get_random_bytes(&table->key, sizeof(table->key));
> +        }
> +
> +        static inline hlist_head *some_hashtable_bucket(struct some_hashtable *table, struct interesting_input *input)
> +        {
> +                return &table->hashtable[siphash(input, sizeof(*input), &table->key) & (HASH_SIZE(table->hashtable) - 1)];
> +        }
> +
> +然后，你可以像往常一样对返回的哈希存储桶进行迭代。
> +
> +安全性
> +======
> +
> +SipHash有着非常高的安全性,因为其有128位的密钥。只要密钥是保密的，
> +即使攻击者看到多个输出，也无法猜测出函数的正确输出，因为2^128次
> +方个输出是非常庞大的。
> +
> +Linux实现了SipHash的“2-4”变体
> +
> +Struct-passing陷阱
> +==================
> +
> +通常情况下，XuY函数的输出长度不够大，因此你可能需要传递一个预填充
> +的结构体给SipHash，在这样做时，务必确保结构体没有填充空隙，最简单
> +的方法就是将结构体的成员按照大小降序的方式排序，并且使用offsetofend()
> +函数代替sizeof()来获取结构体大小，出于性能的考虑，如果可以的话，最
> +好将结构体按右边界对齐，示例如下::
> +
> +        const struct {
> +                struct in6_addr saddr;
> +                u32 counter;
> +                u16 dport;
> +        } __aligned(SIPHASH_ALIGNMENT) combined = {
> +                .saddr = *(struct in6_addr *)saddr,
> +                .counter = counter,
> +                .dport = dport
> +        };
> +        u64 h = siphash(&combined, offsetofend(typeof(combined), dport), &secret);
> +
> +资源
> +====
> +
> +如果你有兴趣了解更多信息，请阅读SipHash论文:
> +https://131002.net/siphash/siphash.pdf
> +
> +-------------------------------------------------------------------------------
> +
> +===========================================
> +HalfSipHash 是 SipHash 的一个较不安全的变种
> +===========================================
> +
> +：作者: Jason A.Donenfeld <jason@zx2c4.com>
> +
> +如果你认为SipHash的速度不够快，无法满足你的需求，那么你可以
> +使用HalfSipHash，这是一种令人担忧但是有用的选择。HalfSipHash
> +将SipHash的轮数从“2-4”降低到“1-3”，更令人担心的是，它使用一
> +个容易被穷举攻击的64位密钥(输出为32位)，而不是SipHash的128位
> +密钥，不过，这对于要求高性能“jhash”用户来说这是比较好的选择。
> +
> +HalfSipHash是通过 "hsiphash" 系列函数提供的。
> +
> +.. warning::
> +   绝对不要在作为哈希表键函数之外使用hsiphash函数，只有在你
> +   能完全能确定输出永远不会从内核传输出去的情况下才能使用，
> +   作为缓解哈希表泛洪拒绝服务攻击的一种手段，它仅在某些情况
> +   下比jhash好用。
> +
> +在64位的内核中，hsiphash函数实际上实现的是SipHash-1-3，这是一
> +种减少轮数的SipHash变形，而不是HalfSipHash-1-3。这是因为在64位
> +代码中SipHash-1-3的性能与HalfSipHash-1-3相当，甚至可能更快，请
> +注意，这并不意味这在64位的内核中，hsihpash函数与siphash函数相
> +同，也不意味着他们是安全的；hsihash函数仍然使用一种不太安全的
> +减少轮数的算法，并将输出截断为32位。
> +
> +生成哈希密钥
> +============
> +
> +密钥应始终来源于加密安全的随机数生成，要么使用get random bytes
> +要么使用get random once::
> +
> +        hsiphash_key_t key;
> +        get_random_bytes(&key, sizeof(key));
> +
> +如果你的钥匙来源不是这两个，那么你的做法是错的。
> +
> +使用哈希函数
> +============
> +
> +这个函数有两种变体，一个是接受整数列表，另一种是接受缓冲区::
> +
> +        u32 hsiphash(const void *data, size_t len, const hsiphash_key_t *key);
> +
> +和::
> +
> +        u32 hsiphash_1u32(u32, const hsiphash_key_t *key);
> +        u32 hsiphash_2u32(u32, u32, const hsiphash_key_t *key);
> +        u32 hsiphash_3u32(u32, u32, u32, const hsiphash_key_t *key);
> +        u32 hsiphash_4u32(u32, u32, u32, u32, const hsiphash_key_t *key);
> +
> +如果向一个通用的hsiphash函数传递一个恒定长度的常量，他将在编译
> +的时候将常量折叠，并自动选择一个优化后的函数。
> +
> +哈希表键函数的用法
> +==================
> +
> +::
> +
> +        struct some_hashtable {
> +                DECLARE_HASHTABLE(hashtable, 8);
> +                hsiphash_key_t key;
> +        };
> +
> +        void init_hashtable(struct some_hashtable *table)
> +        {
> +                get_random_bytes(&table->key, sizeof(table->key));
> +        }
> +
> +        static inline hlist_head *some_hashtable_bucket(struct some_hashtable *table, struct interesting_input *input)
> +        {
> +                return &table->hashtable[hsiphash(input, sizeof(*input), &table->key) & (HASH_SIZE(table->hashtable) - 1)];
> +        }
> +
> +然后，你可以像往常一样对返回的哈希存储桶进行迭代。
> +
> +性能
> +====
> +
> +hsiphash()大约比jhash()慢三倍，这是因为有许多替换，不过这些都不是问题，
> +因为哈希表查找不是瓶颈。而且，这些牺牲是为了hsiphash()的安全性和DoS抗
> +性，这是值得的。

Thanks,
Yanteng


