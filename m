Return-Path: <linux-doc+bounces-9823-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDCE858394
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 18:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A04828492C
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 17:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056D313172D;
	Fri, 16 Feb 2024 17:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="S/cM9C8s"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CFF12BF07;
	Fri, 16 Feb 2024 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708103387; cv=none; b=ayd1u/CFbkOkjHy3RrIxgn4E5dZhwvDhpQOs2PfGoWtoh7IeeQB0Hht/ez1bm3V0rKYk8D0iZrgWAzzsH1GXtnqqBVslsyYLrN5YYtKl92WGOGvbt9BTAIh622+2FRc/9mM2yS2d20QwsR7pL+m+PWRE/gLfal9gSyQOfvmCIYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708103387; c=relaxed/simple;
	bh=eHCvsvK7FzSYW+2FVZi4jYh9j3AL+F2oTzbeXUur3NY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=KQemAojXEZKFP2DQQSEf0l+WvtTESC9Q936wxiIi+o3Iw/PxCAf3JiANyMI3fEqfi5zlY4rNVEyW+UclEEgEPinzNLcIKbk9udjI5FTjbbcuaiSgbMKSGZ8IVAn9WVQq5gTX/pZ3Mf8X+qMm6ZDXQ59SAleEVJQjAhLG+5xeOuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=S/cM9C8s; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 41GH8CxZ2177841
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 16 Feb 2024 09:08:13 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 41GH8CxZ2177841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024021201; t=1708103295;
	bh=yE41dwzByXf5KF23clNh/IHW7SK625SXni353rbEmD4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=S/cM9C8syGe2Gd1h7OZtWYEh86Htb1CAw+qb17ipbI17JAYuVgsA8u2DTTv/rAvEg
	 Hh3YNClUsDhVj/OpgIJCurvaZEZJsRy6YeLUEcQYyLufeGrtYAgkm726jqbutPEOPk
	 7GJD+X5wbOD3TJeqJ8tH9cQixad1uN/kyfxDYNUTLk+BD77p+xEg+u3g0qyH8DtIcn
	 AitqPQz9BL0FEaYCQQ5McbLSUydiErVHqy5yaqmSPpnuaEOvWo55Qiqr0Ax1C1rRgj
	 9uMyJnSY7Ysel8VBdKp8JW9V+0Q6R5IhJDKMNn4ddndgudhXvZ8APOJ+O6+2LBuCdz
	 vrndxYarlkWRA==
Date: Fri, 16 Feb 2024 09:08:09 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>,
        Matthew Wilcox <willy@infradead.org>,
        Petr Tesarik <petrtesarik@huaweicloud.com>
CC: Dave Hansen <dave.hansen@intel.com>,
        =?UTF-8?Q?Petr_Tesa=C5=99=C3=ADk?= <petr@tesarici.cz>,
        Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>, Xin Li <xin3.li@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Kees Cook <keescook@chromium.org>,
        "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>, Ze Gao <zegao2021@gmail.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Kai Huang <kai.huang@intel.com>, David Woodhouse <dwmw@amazon.co.uk>,
        Brian Gerst <brgerst@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Joerg Roedel <jroedel@suse.de>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Tina Zhang <tina.zhang@intel.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Petr Tesarik <petr.tesarik1@huawei-partners.com>
Subject: Re: [RFC 6/8] KEYS: PGP data parser
User-Agent: K-9 Mail for Android
In-Reply-To: <5916fa3ac3d0ce2ade71e7ed1c9eb6923e374c1f.camel@huaweicloud.com>
References: <fb4a40c7-af9a-406a-95ab-406595f3ffe5@intel.com> <20240216152435.1575-1-petrtesarik@huaweicloud.com> <20240216152435.1575-7-petrtesarik@huaweicloud.com> <Zc-Q5pVHjngq9lpX@casper.infradead.org> <5916fa3ac3d0ce2ade71e7ed1c9eb6923e374c1f.camel@huaweicloud.com>
Message-ID: <EC53BCED-0D4C-4561-9041-584378326DD5@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 16, 2024 8:53:01 AM PST, Roberto Sassu <roberto=2Esassu@huaweic=
loud=2Ecom> wrote:
>On Fri, 2024-02-16 at 16:44 +0000, Matthew Wilcox wrote:
>> On Fri, Feb 16, 2024 at 04:24:33PM +0100, Petr Tesarik wrote:
>> > From: David Howells <dhowells@redhat=2Ecom>
>> >=20
>> > Implement a PGP data parser for the crypto key type to use when
>> > instantiating a key=2E
>> >=20
>> > This parser attempts to parse the instantiation data as a PGP packet
>> > sequence (RFC 4880) and if it parses okay, attempts to extract a publ=
ic-key
>> > algorithm key or subkey from it=2E
>>=20
>> I don't understand why we want to do this in-kernel instead of in
>> userspace and then pass in the actual key=2E
>
>Sigh, this is a long discussion=2E
>
>PGP keys would be used as a system-wide trust anchor to verify RPM
>package headers, which already contain file digests that can be used as
>reference values for kernel-enforced integrity appraisal=2E
>
>With the assumptions that:
>
>- In a locked-down system the kernel has more privileges than root
>- The kernel cannot offload this task to an user space process due to
>  insufficient isolation
>
>the only available option is to do it in the kernel (that is what I got
>as suggestion)=2E
>
>Roberto
>
>

Ok, at least one of those assumptions is false, and *definitely* this appr=
oach seems to be a solution in search of a problem=2E

