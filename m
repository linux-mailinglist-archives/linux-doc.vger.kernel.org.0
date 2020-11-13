Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03682B27EE
	for <lists+linux-doc@lfdr.de>; Fri, 13 Nov 2020 23:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725885AbgKMWK7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 Nov 2020 17:10:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgKMWK6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 17:10:58 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983D0C0613D1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 14:10:58 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 40BB6734;
        Fri, 13 Nov 2020 22:10:58 +0000 (UTC)
Date:   Fri, 13 Nov 2020 15:10:57 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-doc@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v1] scripts: kernel-doc: Restore anonymous enum parsing
Message-ID: <20201113151057.5dd84722@lwn.net>
In-Reply-To: <20201102170637.36138-1-andriy.shevchenko@linux.intel.com>
References: <20201102170637.36138-1-andriy.shevchenko@linux.intel.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  2 Nov 2020 19:06:37 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> The commit d38c8cfb0571 ("scripts: kernel-doc: add support for typedef enum")
> broke anonymous enum parsing. Restore it by relying on members rather than
> its name.
> 
> Fixes: d38c8cfb0571 ("scripts: kernel-doc: add support for typedef enum")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index f699cf05d409..9b6ddeb097e9 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1390,7 +1390,7 @@ sub dump_enum($$) {
>  	$members = $2;
>      }
>  
> -    if ($declaration_name) {
> +    if ($members) {
>  	my %_members;

Applied, thanks.

jon
