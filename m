Return-Path: <linux-doc+bounces-5689-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6E81AEA9
	for <lists+linux-doc@lfdr.de>; Thu, 21 Dec 2023 07:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 021891F24832
	for <lists+linux-doc@lfdr.de>; Thu, 21 Dec 2023 06:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F63AB654;
	Thu, 21 Dec 2023 06:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0QKCcYhe"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0864B647;
	Thu, 21 Dec 2023 06:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=fEMnsN9fKsacrZv+PZoSB1BdLYTdkoVYZcEdsoJrm0c=; b=0QKCcYhei8MIe3PofdWJOU/whE
	Sr+aBpUIB950oRXoDWH3KzwU6M6Xi/fTyaG6Jmuxk3+y97Bhae3xsHqbjn6zptXyUVGDI6GRbwdjQ
	6irkAnBpJaQYJLrf1U8tOeUHVN6yUToiAF46w/Mvc5sHXax5Jm8Vqmu5i+TMmJaY5+nkewazeZnf+
	eU8zOauAqwJLsQiq2EPNkczGlZAgF4ihlq68hogAzTFQNdPcQwYUKHmqRF2qaAA7fCdLBfudfjU9W
	J35Zyf7JIMSki1DzGKodv27CMMIyHW4CU25QxWGn2QASc99gsP4rplySZFxwWKa8vNYGhD7idK/ZM
	j42TQlqg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rGCHp-001nrQ-0L;
	Thu, 21 Dec 2023 06:12:02 +0000
Message-ID: <aa2ddfcc-8f2e-42c7-a81d-651a281eb6a3@infradead.org>
Date: Wed, 20 Dec 2023 22:11:58 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] docs: Include simplified link titles in main page's
 index
Content-Language: en-US
To: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet
 <corbet@lwn.net>, Carlos Bilbao <bilbao@vt.edu>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20231211005442.95457-1-bilbao@vt.edu>
 <87o7erqxhm.fsf@meer.lwn.net>
 <b55dc12b-0cd3-4f56-803e-4b26f1117c91@oracle.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <b55dc12b-0cd3-4f56-803e-4b26f1117c91@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/20/23 21:59, Vegard Nossum wrote:
> On 15/12/2023 16:47, Jonathan Corbet wrote:
>> Carlos Bilbao <bilbao@vt.edu> writes:
>>
>>> The general consensus is that the documentation's website main entry point
>>> and its sidebar leave room for improvement.
> [...]
>> Meanwhile, I'm pondering on this patch, would like to know what others
>> think.  Carlos nicely put up some comparison images for us:
>>
>>    https://github.com/Zildj1an/linux-kernel-docs-compare/blob/main/comparison.png
> 
> FWIW, I like it, but I would suggest these changes:
> 
> Driver implementation API -> Driver APIs
> Testing -> Testing guide
> Hacking -> Hacking guides
> User-space tools -> Userspace tools
> User-space API -> Userspace APIs
> CPU Architectures -> CPU architectures
> 
> I know "user space" is technically two words, but the one-word form is
> MUCH more prevalent in the kernel, for example if you check the mainline
> log you'll see something like:
> 
> $ git log --grep 'user.*space' | grep -o 'user.*space' | sort | uniq -c | sort -g | tail -n 3
>    3135 user-space
>    7835 user space
>   26917 userspace
> 
> I think it makes sense to pluralize API -> APIs in most places, so e.g.
> "Core APIs", "Driver APIs", "Userspace APIs". Just to emphasize that
> these are really collections of disparate APIs (e.g. workqueues is one
> API, linked lists is another, etc.).

+1 for all suggestions.

Thanks.
-- 
#Randy

