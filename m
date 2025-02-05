Return-Path: <linux-doc+bounces-37063-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA2A29B09
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 21:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD7BA18886E4
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 20:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEFF211A22;
	Wed,  5 Feb 2025 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="IuXkxOY8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09A7846F
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 20:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786814; cv=none; b=c40EJ5DJAcYQ2Qh/dY0gz3PVQC7avvKJpl+UvHAe6ZjJNWY2sE6GEw7ga5jpJZu5TQ0AeSez26jyiIJ8Iqd/w+oIIy2hzusWEwpytBegAUbZnauzspr0ruIKXigcXVUf9FV9Z2VNd0eCShZ0qGBg3QUwkUXl1K+YyeGGvJVa2vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786814; c=relaxed/simple;
	bh=Ezk6LdfbT2eMczzWQIRh+cgAaehpdYAJViALrkZmMdY=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=FVoX5Du/Fnvold8gXXArur+B4p1PUCin4jVREnsSCy5ILS7OqdyWJf3ZsFoZq5ReFfzCgRJe0DV6R/4AVz3LkldkLdTNvmcsqcuxortr4afQGM/0w01zF1YqDYdY5dBA176ywF/JtVD7Z8+bZUPtVvQkztKaaUGEFpz00j1jeOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=IuXkxOY8; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f9ef7a3c3cso1309025a91.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2025 12:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1738786811; x=1739391611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IX+Sh5T3PaL+QWEnl0hjKKEH7VOJE9BsDETeBZSLsC4=;
        b=IuXkxOY8fFa9jP3wtcr1qDLd9qaEkQGPzHluKV/9vt0IZcoEYIHfv7c20HUNSoQwhF
         1/fhZI7nxgaeM6zDPWwyC+Y1aDoshUsH8lhargQW4eR4x3d/pcDdAaRQGOu+uASHXxk0
         UbkJ8A3HO86wIQCFyAhxFwbsIAvJSm35KlmbKMwQvZfysjMPvX3i18IZGCG2rRFAB38k
         MUeCn+iXUsPmsoVwi0r+B9TE7WznaIb1ZZRLqLHmjuBhVVQ7Qpebn2+GUDLedt8yj4T+
         cECuqY2z8JTKysvpuj+zEXTMEEnhow0KOMCDiGpXVLj4F+y1dIlbsqj2MCLxuW8rpU9y
         IcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738786811; x=1739391611;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IX+Sh5T3PaL+QWEnl0hjKKEH7VOJE9BsDETeBZSLsC4=;
        b=d5QGWiOvo9emK0eJB52oKpk7MYAQCVWYI3KbchqJ0s/6HwMQYKnF5bIlOZv0LFK0un
         eUTOmpVX8Z8CMe6uIqOZTrifl+sTOMc/EuNuRf+CiLvXCdlbg/6QXbD0hGOtuAZqw1fg
         qmuSHVmyh5AQ67nAlFv8wVYOiJD/g97M6+5JyOMiKjtJ1cy/OPAHXzZJT7e7XCttI386
         7kY1RP7EE+YXCIofuJx2u2d0DoNGAe6+E7izQQO5GNdObajhGyyvKtyaHpNJmtHDQEij
         ukSHCtLj+fK2OAwQ6bWhoW0Yn5Af3By8RTCuMLyW5Bf+lOa3cwjjEYobrhKEOoR/JqII
         2Nsw==
X-Forwarded-Encrypted: i=1; AJvYcCXEuciyUrobuFIHE2A/fawS1LXcsybzqSM+35nLL1wQUw5ISMBQoojXoyM/3QzkSgCUG/Wbt4VnMWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLGZCx+MWQSXwnU9yMHxnZ1ewwQ4JSxUTeM+Sjc6SnFP81qrOd
	grjg6WpIy+RtbFCgp5/DxiXhbaM+Wfya1p9YenIgHtYcvwnSXSUm2gKU91gWbpw=
X-Gm-Gg: ASbGncum/slvEVwgJbOBQqEdVNYPuIIhb3U1SXCpINSBJuitaHB7eE5+gd9DxVYyrwM
	wT3miIwCasbSOwqLJ77F7HO5dA5RncfTwEyz/4/6cK869wwfA9QYpUaSEnoT/5YyCBjetPPhlYJ
	KXEQlgCr1Y5UF+1CWXk71+jS1dSqC7N38SWGCTRD8iDRDmJQgFMHoFMBKFEpjQMKf3aPLEFFRvb
	Wk9Ff8NngdBSPPWBEfHmbrf3IZ1QW1CPIJiftJPQpJtNT1XSpQ5SbCguW4zpAzvBLnagNSCAqnH
	WHxiVg1nN1Oe
X-Google-Smtp-Source: AGHT+IEFjhGWBA15EiC5Nj97NLp62uuszO3tIVmMaUsJvfBeL6+xT+t6gGEWElptXMC2M0mhdTS+Lw==
X-Received: by 2002:a17:90a:e7c8:b0:2f7:b149:538f with SMTP id 98e67ed59e1d1-2f9ff787646mr1078810a91.4.1738786810832;
        Wed, 05 Feb 2025 12:20:10 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1d77b73sm2228736a91.12.2025.02.05.12.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:20:10 -0800 (PST)
Date: Wed, 05 Feb 2025 12:20:10 -0800 (PST)
X-Google-Original-Date: Wed, 05 Feb 2025 12:20:08 PST (-0800)
Subject:     Re: [PATCH 04/15] kasan: arm64: x86: risc-v: Make special tags arch specific
In-Reply-To: <cdb119dcade0cea25745c920aba8434c27e4c93b.1738686764.git.maciej.wieczor-retman@intel.com>
CC: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, tj@kernel.org,
  andreyknvl@gmail.com, brgerst@gmail.com, Ard Biesheuvel <ardb@kernel.org>,
  dave.hansen@linux.intel.com, jgross@suse.com, Will Deacon <will@kernel.org>, akpm@linux-foundation.org,
  Arnd Bergmann <arnd@arndb.de>, corbet@lwn.net, maciej.wieczor-retman@intel.com, dvyukov@google.com,
  richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, hpa@zytor.com, seanjc@google.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com,
  glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, vincenzo.frascino@arm.com,
  rafael.j.wysocki@intel.com, ndesaulniers@google.com, mingo@redhat.com,
  Catalin Marinas <catalin.marinas@arm.com>, junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com,
  dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com,
  dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, peterz@infradead.org, cl@linux.com,
  kees@kernel.org, kasan-dev@googlegroups.com, x86@kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: maciej.wieczor-retman@intel.com
Message-ID: <mhng-33ede5ce-7625-431b-a48f-fd6abf7f78ba@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 04 Feb 2025 09:33:45 PST (-0800), maciej.wieczor-retman@intel.com wrote:
> KASAN's tag-based mode defines multiple special tag values. They're
> reserved for:
> - Native kernel value. On arm64 it's 0xFF and it causes an early return
>   in the tag checking function.
> - Invalid value. 0xFE marks an area as freed / unallocated. It's also
>   the value that is used to initialize regions of shadow memory.
> - Max value. 0xFD is the highest value that can be randomly generated
>   for a new tag.
>
> Metadata macro is also defined:
> - Tag width equal to 8.
>
> Tag-based mode on x86 is going to use 4 bit wide tags so all the above
> values need to be changed accordingly.
>
> Make tags arch specific for x86, risc-v and arm64. On x86 the values
> just lose the top 4 bits.
>
> Replace hardcoded kernel tag value and tag width with macros in KASAN's
> non-arch specific code.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
>  MAINTAINERS                         |  2 +-
>  arch/arm64/include/asm/kasan-tags.h |  9 +++++++++
>  arch/riscv/include/asm/kasan-tags.h | 12 ++++++++++++
>  arch/riscv/include/asm/kasan.h      |  4 ----
>  arch/x86/include/asm/kasan-tags.h   |  9 +++++++++
>  include/linux/kasan-tags.h          | 12 +++++++++++-
>  include/linux/kasan.h               |  4 +++-
>  include/linux/mm.h                  |  6 +++---
>  include/linux/page-flags-layout.h   |  7 +------
>  9 files changed, 49 insertions(+), 16 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kasan-tags.h
>  create mode 100644 arch/riscv/include/asm/kasan-tags.h
>  create mode 100644 arch/x86/include/asm/kasan-tags.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b878ddc99f94..45671faa3b6f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12227,7 +12227,7 @@ L:	kasan-dev@googlegroups.com
>  S:	Maintained
>  B:	https://bugzilla.kernel.org/buglist.cgi?component=Sanitizers&product=Memory%20Management
>  F:	Documentation/dev-tools/kasan.rst
> -F:	arch/*/include/asm/*kasan.h
> +F:	arch/*/include/asm/*kasan*.h
>  F:	arch/*/mm/kasan_init*
>  F:	include/linux/kasan*.h
>  F:	lib/Kconfig.kasan
> diff --git a/arch/arm64/include/asm/kasan-tags.h b/arch/arm64/include/asm/kasan-tags.h
> new file mode 100644
> index 000000000000..9e835da95f6b
> --- /dev/null
> +++ b/arch/arm64/include/asm/kasan-tags.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_KASAN_TAGS_H
> +#define __ASM_KASAN_TAGS_H
> +
> +#define KASAN_TAG_KERNEL	0xFF /* native kernel pointers tag */
> +
> +#define KASAN_TAG_WIDTH 8
> +
> +#endif /* ASM_KASAN_TAGS_H */
> diff --git a/arch/riscv/include/asm/kasan-tags.h b/arch/riscv/include/asm/kasan-tags.h
> new file mode 100644
> index 000000000000..83d7dcc8af74
> --- /dev/null
> +++ b/arch/riscv/include/asm/kasan-tags.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_KASAN_TAGS_H
> +#define __ASM_KASAN_TAGS_H
> +
> +#ifdef CONFIG_KASAN_SW_TAGS
> +#define KASAN_TAG_KERNEL	0x7f /* native kernel pointers tag */
> +#endif
> +
> +#define KASAN_TAG_WIDTH 8
> +
> +#endif /* ASM_KASAN_TAGS_H */
> +
> diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
> index f6b378ba936d..27938e0d5233 100644
> --- a/arch/riscv/include/asm/kasan.h
> +++ b/arch/riscv/include/asm/kasan.h
> @@ -41,10 +41,6 @@
>
>  #define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>
> -#ifdef CONFIG_KASAN_SW_TAGS
> -#define KASAN_TAG_KERNEL	0x7f /* native kernel pointers tag */
> -#endif
> -
>  #define arch_kasan_set_tag(addr, tag)	__tag_set(addr, tag)
>  #define arch_kasan_reset_tag(addr)	__tag_reset(addr)
>  #define arch_kasan_get_tag(addr)	__tag_get(addr)
> diff --git a/arch/x86/include/asm/kasan-tags.h b/arch/x86/include/asm/kasan-tags.h
> new file mode 100644
> index 000000000000..68ba385bc75c
> --- /dev/null
> +++ b/arch/x86/include/asm/kasan-tags.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_KASAN_TAGS_H
> +#define __ASM_KASAN_TAGS_H
> +
> +#define KASAN_TAG_KERNEL	0xF /* native kernel pointers tag */
> +
> +#define KASAN_TAG_WIDTH		4
> +
> +#endif /* ASM_KASAN_TAGS_H */
> diff --git a/include/linux/kasan-tags.h b/include/linux/kasan-tags.h
> index e07c896f95d3..b4aacfa8709b 100644
> --- a/include/linux/kasan-tags.h
> +++ b/include/linux/kasan-tags.h
> @@ -2,7 +2,17 @@
>  #ifndef _LINUX_KASAN_TAGS_H
>  #define _LINUX_KASAN_TAGS_H
>
> -#include <asm/kasan.h>
> +#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
> +#include <asm/kasan-tags.h>
> +#endif
> +
> +#ifdef CONFIG_KASAN_SW_TAGS_DENSE
> +#define KASAN_TAG_WIDTH		4
> +#endif
> +
> +#ifndef KASAN_TAG_WIDTH
> +#define KASAN_TAG_WIDTH		0
> +#endif
>
>  #ifndef KASAN_TAG_KERNEL
>  #define KASAN_TAG_KERNEL	0xFF /* native kernel pointers tag */
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 5a3e9bec21c2..83146367170a 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -88,7 +88,9 @@ static inline u8 kasan_get_shadow_tag(const void *addr)
>
>  #ifdef CONFIG_KASAN_SW_TAGS
>  /* This matches KASAN_TAG_INVALID. */
> -#define KASAN_SHADOW_INIT 0xFE
> +#ifndef KASAN_SHADOW_INIT
> +#define KASAN_SHADOW_INIT KASAN_TAG_INVALID
> +#endif
>  #else
>  #define KASAN_SHADOW_INIT 0
>  #endif
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 61fff5d34ed5..ddca2f63a5f6 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1813,7 +1813,7 @@ static inline u8 page_kasan_tag(const struct page *page)
>
>  	if (kasan_enabled()) {
>  		tag = (page->flags >> KASAN_TAG_PGSHIFT) & KASAN_TAG_MASK;
> -		tag ^= 0xff;
> +		tag ^= KASAN_TAG_KERNEL;
>  	}
>
>  	return tag;
> @@ -1826,7 +1826,7 @@ static inline void page_kasan_tag_set(struct page *page, u8 tag)
>  	if (!kasan_enabled())
>  		return;
>
> -	tag ^= 0xff;
> +	tag ^= KASAN_TAG_KERNEL;
>  	old_flags = READ_ONCE(page->flags);
>  	do {
>  		flags = old_flags;
> @@ -1845,7 +1845,7 @@ static inline void page_kasan_tag_reset(struct page *page)
>
>  static inline u8 page_kasan_tag(const struct page *page)
>  {
> -	return 0xff;
> +	return KASAN_TAG_KERNEL;
>  }
>
>  static inline void page_kasan_tag_set(struct page *page, u8 tag) { }
> diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags-layout.h
> index 7d79818dc065..ac3576f409ad 100644
> --- a/include/linux/page-flags-layout.h
> +++ b/include/linux/page-flags-layout.h
> @@ -3,6 +3,7 @@
>  #define PAGE_FLAGS_LAYOUT_H
>
>  #include <linux/numa.h>
> +#include <linux/kasan-tags.h>
>  #include <generated/bounds.h>
>
>  /*
> @@ -72,12 +73,6 @@
>  #define NODE_NOT_IN_PAGE_FLAGS	1
>  #endif
>
> -#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
> -#define KASAN_TAG_WIDTH 8
> -#else
> -#define KASAN_TAG_WIDTH 0
> -#endif
> -
>  #ifdef CONFIG_NUMA_BALANCING
>  #define LAST__PID_SHIFT 8
>  #define LAST__PID_MASK  ((1 << LAST__PID_SHIFT)-1)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

Probably best to keep this along with the rest of the patches, but LMK 
if you want me to point something at the RISC-V tree.

