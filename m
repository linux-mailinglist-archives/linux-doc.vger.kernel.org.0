Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C172A328E
	for <lists+linux-doc@lfdr.de>; Mon,  2 Nov 2020 19:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgKBSKs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Nov 2020 13:10:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:39744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgKBSKs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Nov 2020 13:10:48 -0500
Received: from coco.lan (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A1EA22226;
        Mon,  2 Nov 2020 18:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604340647;
        bh=ddleVnUk7JszfcGdOO1dRre9fMD2uABiQw+EK9RxIR8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=axMojZP/o7BZAe99QuvRZN0zjNDgEXAwc4yrafqaGnU3Vmtro/orHc86kPfyyiBsW
         H3SjjyKj7ScMSUqvrHvhf2GsKYwId9zvzUjlZfVmdMJA2oyZQq1OnA/4QpPKG/C2u+
         ANhO/cXXp5ftjzZkFTyqw1J33oqMI6R+aq4jt2So=
Date:   Mon, 2 Nov 2020 19:10:41 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1] scripts: kernel-doc: Restore anonymous enum parsing
Message-ID: <20201102191041.66179ad6@coco.lan>
In-Reply-To: <20201102174846.GT4077@smile.fi.intel.com>
References: <20201102170637.36138-1-andriy.shevchenko@linux.intel.com>
        <20201102182743.77b4c8df@coco.lan>
        <20201102174846.GT4077@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Mon, 2 Nov 2020 19:48:46 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:

> On Mon, Nov 02, 2020 at 06:27:43PM +0100, Mauro Carvalho Chehab wrote:
> > Em Mon,  2 Nov 2020 19:06:37 +0200
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:
> >   
> > > The commit d38c8cfb0571 ("scripts: kernel-doc: add support for typedef enum")
> > > broke anonymous enum parsing. Restore it by relying on members rather than
> > > its name.
> > > 
> > > Fixes: d38c8cfb0571 ("scripts: kernel-doc: add support for typedef enum")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>  
> > 
> > Patch looks ok to me. Do you have an example about using it for
> > anonymous enum?  
> 
> drivers/pinctrl/intel/pinctrl-intel.c
> 

Thanks! 

Both include/linux/phy.h and drivers/pinctrl/intel/pinctrl-intel.c
are parsing fine after your patch.

So,

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks,
Mauro
