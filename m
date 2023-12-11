Return-Path: <linux-doc+bounces-4638-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A0B80BECF
	for <lists+linux-doc@lfdr.de>; Mon, 11 Dec 2023 02:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F58E1C208D9
	for <lists+linux-doc@lfdr.de>; Mon, 11 Dec 2023 01:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DA6A950;
	Mon, 11 Dec 2023 01:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Kovonbwy"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3D9D7;
	Sun, 10 Dec 2023 17:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=DodnFSVXUrv+dYqEJmTFxfTJUgoqYPQKyRrSoXKQiis=; b=KovonbwySyDVaBHuxdMEzRfnQY
	Y6cB+On3e3V/hG6OnJ0GvxbiyG5DOEqSx9j5nTJa101UXBu2MPPI+oz3A9/E4PYRD37lp4eoiqaQi
	v3dOeiDQ6Hn63pElBUjJSq2T4wH3H3WQUQgZ1VfmQp2HLElZWPSd2kma9a/SllVvHA+qtf2/GUBsH
	SQvVLQjqP4F4m4qzr8zzoHNhcrBhZUnRKoEvsotbzYex9e5gY4e3pUCl+wojO2r+Xn4Ib4M/6nTFn
	zVNaBCR+Db0emQJ10y+XOHrpt/TedJsSn7vWBoo2lTPyu9mYm3Yyvi40PgJHLXVzHSWkFlLkALIC4
	FHoBxlZg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rCVIs-003jq4-1a;
	Mon, 11 Dec 2023 01:41:50 +0000
Message-ID: <9b52c145-7466-4e81-a911-25f472c2a2ea@infradead.org>
Date: Sun, 10 Dec 2023 17:41:49 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1 RESEND] docs: Include simplified link titles in main
 page's index
Content-Language: en-US
To: Carlos Bilbao <bilbao@vt.edu>, Jonathan Corbet <corbet@lwn.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <58e78693-82d1-451d-a546-51fb64ef6eb5@vt.edu>
 <dcab1e08-c054-441b-8d4e-f46e2f22605c@vt.edu>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <dcab1e08-c054-441b-8d4e-f46e2f22605c@vt.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Carlos,

On 12/10/23 17:20, Carlos Bilbao wrote:
> Include simplified link titles in the main page's documentation index to
> enhance website's readability and UX. Update the text that directs users to
> various documents without changing the actual titles chosen by the authors.
> 
> Signed-off-by: Carlos Bilbao <bilbao@vt.edu>
> ---
>  Documentation/index.rst | 50 ++++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index 9dfdc826618c..be395d0a4318 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -22,10 +22,10 @@ community and getting your work upstream.
>  .. toctree::
>     :maxdepth: 1
>  
> -   process/development-process
> -   process/submitting-patches
> +   Development process <process/development-process>
> +   Submitting patches <process/submitting-patches>
>     Code of conduct <process/code-of-conduct>
> -   maintainer/index
> +   Maintainer handbook <maintainer/index>
>     All development-process docs <process/index>
>  
>  
> @@ -38,10 +38,10 @@ kernel.
>  .. toctree::
>     :maxdepth: 1
>  
> -   core-api/index
> -   driver-api/index
> -   subsystem-apis
> -   Locking in the kernel <locking/index>
> +   Core API <core-api/index>
> +   Driver implementation API <driver-api/index>
> +   Subsystems <subsystem-apis>
> +   Locking <locking/index>
>  
>  Development tools and processes
>  ===============================
> @@ -51,15 +51,15 @@ Various other manuals with useful information for all kernel developers.
>  .. toctree::
>     :maxdepth: 1
>  
> -   process/license-rules
> -   doc-guide/index
> -   dev-tools/index
> -   dev-tools/testing-overview
> -   kernel-hacking/index
> -   trace/index
> -   fault-injection/index
> -   livepatch/index
> -   rust/index
> +   Licensing rules <process/license-rules>
> +   Writing documentation <doc-guide/index>
> +   Development tools <dev-tools/index>
> +   Testing <dev-tools/testing-overview>
> +   Hacking <kernel-hacking/index>
> +   Tracing <trace/index>
> +   Fault injection <fault-injection/index>
> +   Livepatching <livepatch/index>
> +   Rust <rust/index>
>  
>  
>  User-oriented documentation
> @@ -72,11 +72,11 @@ developers seeking information on the kernel's user-space APIs.
>  .. toctree::
>     :maxdepth: 1
>  
> -   admin-guide/index
> -   The kernel build system <bailed/index>

Where do the subdir names "bailed" above and "bugled" below come from?

> -   admin-guide/reporting-issues.rst
> +   Administration <admin-guide/index>
> +   Build system <bugled/index>

                    ^^^^^^


Thanks.

> +   Reporting issues <admin-guide/reporting-issues.rst>
>     User-space tools <tools/index>
> -   userspace-api/index
> +   User-space API <userspace-api/index>
>  
>  See also: the `Linux man pages <https://www.kernel.org/doc/man-pages/>`_,
>  which are kept separately from the kernel's own documentation.
> @@ -89,8 +89,8 @@ platform firmwares.
>  .. toctree::
>     :maxdepth: 1
>  
> -   firmware-guide/index
> -   devicetree/index
> +   Firmware <firmware-guide/index>
> +   Firmware and Devicetree <devicetree/index>
>  
>  
>  Architecture-specific documentation
> @@ -99,7 +99,7 @@ Architecture-specific documentation
>  .. toctree::
>     :maxdepth: 2
>  
> -   arch/index
> +   CPU Architectures <arch/index>
>  
>  
>  Other documentation
> @@ -112,7 +112,7 @@ to ReStructured Text format, or are simply too old.
>  .. toctree::
>     :maxdepth: 1
>  
> -   staging/index
> +   Unsorted documentation <staging/index>
>  
>  
>  Translations
> @@ -121,7 +121,7 @@ Translations
>  .. toctree::
>     :maxdepth: 2
>  
> -   translations/index
> +   Translations <translations/index>
>  
>  Indices and tables
>  ==================

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html

