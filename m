Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947392735BE
	for <lists+linux-doc@lfdr.de>; Tue, 22 Sep 2020 00:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgIUW0m (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Sep 2020 18:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbgIUW0m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Sep 2020 18:26:42 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5084AC061755
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2020 15:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=qrwUlsTwpztwtI5oP4s9vzKqKM85Y0mzRbVvpBF1QC8=; b=iShxZ4Rt3d6z7ZO6QJHXXlcYH5
        FANkBr0k+vbNfBCP6wAqtCwugZDIoKXc98eFclNsqu+WhGOcyEBwZVFwo62HAn39N3rs39RRcQWbu
        Ibxy6hzR+5wUxyaOx3Vp+cxQCOhaTrn+Cm28A5a4hKphfTqrwv7zjTWl70zFsjvQNGD8SEtGP4sfc
        A25RuoynHKd2ZLOTxXauwm5yQa5cJ8KrO9G+y3uiyr/XGVX2dP3bmI5c3x+ky1PPcT+zNu7TKKfSY
        jnepIgTS10jzSGrGG48pLa8nbH3nUvUn2Dv2u2qQkHla/7N8wIGKxLcKi22fsefCDcFP1b47vbKqR
        dzgV10LQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kKUGd-0003XC-Dh; Mon, 21 Sep 2020 22:26:39 +0000
Date:   Mon, 21 Sep 2020 23:26:39 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [PATCH RFC] Make the docs build "work" with Sphinx 3.x
Message-ID: <20200921222639.GY32101@casper.infradead.org>
References: <20200904102925.52fcd2a1@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904102925.52fcd2a1@lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 04, 2020 at 10:29:25AM -0600, Jonathan Corbet wrote:
> +# cdomain is badly broken in Sphinx 3+.  Leaving it out generates *most*
> +# of the docs correctly, but not all.  Scream bloody murder but allow
> +# the process to proceed; hopefully somebody will fix this properly soon.
> +#
> +if major >= 3:
> +    sys.stderr.write('''WARNING: The kernel documentation build process
> +	does not work correctly with Sphinx v3.0 and above.  Expect errors
> +	in the generated output.

Should we be converting the kernel-doc script to output 3.0-style markup
for structs?

https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html#c-roles
