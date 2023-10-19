Return-Path: <linux-doc+bounces-659-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB157CFEAA
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 17:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEDCF1C20E65
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 15:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FE4315BE;
	Thu, 19 Oct 2023 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qZsHla9x"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1929A30FB0
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 15:48:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE73E124;
	Thu, 19 Oct 2023 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=pn3uO/arD3fO0IFGZTIzO6TjABrdzGr297my+fEHmUs=; b=qZsHla9xapeuTcdf/k4ygwi3t/
	GmHwYEmzui2YwSQH7yrQjNzyI2Yl/3xhT2pokj4XVvs5Uq+9lt7Mkp9AFXexEAQ31W9Ct0MxN2eE8
	kjVj/ToQVgIZjWvgJ5C7jnI824xC5JVLxNQdjYePJMbjsrzCOk8MNXQd+YdOQLn/w36jUsPWaYjCg
	dpC5/pWzPKL37XXRoVLGIquVMjakYflpe4fPNjBrnyEYvxOtpXfe6d3tlZhfpJTEyZ7WAFyWLV4vk
	nSr/2vwK+/jcluTnfcT/K92XZc1OXefq256ymHJA/wx/rz0ytSe7wdSm2SXX2epygBs1pqiro6eDU
	J/HnN6Rw==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVGC-000FWt-2e;
	Thu, 19 Oct 2023 15:48:32 +0000
Message-ID: <d0c6044f-11e0-4f00-b7e6-eaf1e72f17a5@infradead.org>
Date: Thu, 19 Oct 2023 08:48:32 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sh: bios: Revive earlyprintk support
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonathan Corbet <corbet@lwn.net>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1697708489.git.geert+renesas@glider.be>
 <c40972dfec3dcc6719808d5df388857360262878.1697708489.git.geert+renesas@glider.be>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <c40972dfec3dcc6719808d5df388857360262878.1697708489.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/19/23 02:46, Geert Uytterhoeven wrote:
> The SuperH BIOS earlyprintk code is protected by CONFIG_EARLY_PRINTK.
> However, when this protection was added, it was missed that SuperH no
> longer defines an EARLY_PRINTK config symbol since commit
> e76fe57447e88916 ("sh: Remove old early serial console code V2"), so
> BIOS earlyprintk can no longer be used.
> 
> Fix this by reviving the EARLY_PRINTK config symbol.
> 
> Fixes: d0380e6c3c0f6edb ("early_printk: consolidate random copies of identical code")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/sh/Kconfig.debug | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/sh/Kconfig.debug b/arch/sh/Kconfig.debug
> index c449e7c1b20ff5b5..8bcd6c1431a95be9 100644
> --- a/arch/sh/Kconfig.debug
> +++ b/arch/sh/Kconfig.debug
> @@ -22,6 +22,17 @@ config STACK_DEBUG
>  	  every function call and will therefore incur a major
>  	  performance hit. Most users should say N.
>  
> +config EARLY_PRINTK
> +	bool "Early printk"
> +	depends on SH_STANDARD_BIOS
> +	help
> +	  Say Y here to redirect kernel printk messages to the serial port
> +	  used by the SH-IPL bootloader, starting very early in the boot
> +	  process and ending when the kernel's serial console is initialised.
> +	  This option is only useful while porting the kernel to a new machine,

Can we expect to see new machine ports using arch/sh/ ?

> +	  when the kernel may crash or hang before the serial console is
> +	  initialised.  If unsure, say N.
> +
>  config 4KSTACKS
>  	bool "Use 4Kb for kernel stacks instead of 8Kb"
>  	depends on DEBUG_KERNEL && (MMU || BROKEN) && !PAGE_SIZE_64KB


-- 
~Randy

