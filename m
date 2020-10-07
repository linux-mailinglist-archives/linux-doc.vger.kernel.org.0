Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 679B9285B8A
	for <lists+linux-doc@lfdr.de>; Wed,  7 Oct 2020 11:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgJGJFg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Oct 2020 05:05:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:46846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbgJGJFg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Oct 2020 05:05:36 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B688020789;
        Wed,  7 Oct 2020 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602061535;
        bh=42RhLHhep8milANosAI5Nau1e18GjKFGz66AsIO6JMU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wZFTtaczrJZawEoTP9QnsqHrkJkv08bjAP9AuD6t1/X60ifioT4VhKev2sTPuUCbW
         t1+XgmO8aKMj0qAMoTAoRutFtl9yd5963n5vGr/oTJE6d4egUx5QedpVYQHfYkv7B4
         Vprk1nNZhDZivHvtn4u3IE4+rjlMEtcJC6ILYKK0=
Date:   Wed, 7 Oct 2020 11:06:19 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Ivan Zaentsev <ivan.zaentsev@wirenboard.ru>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Akira Shimahara <akira215corp@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Evgeny Boger <boger@wirenboard.com>
Subject: Re: [PATCH 2/2] w1: w1_therm: Add support for GXCAS GX20MH01 device.
Message-ID: <20201007090619.GA613204@kroah.com>
References: <20200904160004.87710-1-ivan.zaentsev@wirenboard.ru>
 <20200904160004.87710-2-ivan.zaentsev@wirenboard.ru>
 <20201006151915.77d044a4@coco.lan>
 <1561045277.20201007103227@wirenboard.ru>
 <20201007105702.67988846@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007105702.67988846@coco.lan>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 07, 2020 at 10:57:02AM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 7 Oct 2020 10:32:27 +0300
> Ivan Zaentsev <ivan.zaentsev@wirenboard.ru> escreveu:
> 
> > Tuesday, October 6, 2020, 4:19:15 PM, Mauro Carvalho Chehab wrote:
> > 
> > >> diff --git a/Documentation/w1/slaves/w1_therm.rst b/Documentation/w1/slaves/w1_therm.rst
> > >> index f1148181f53e..00376501a5ef 100644
> > >> --- a/Documentation/w1/slaves/w1_therm.rst
> > >> +++ b/Documentation/w1/slaves/w1_therm.rst  
> > 
> > >>  
> > >> @@ -130,4 +131,12 @@ conversion and temperature reads 85.00 (powerup value) or 127.94 (insufficient
> > >>  power), the driver returns a conversion error. Bit mask ``2`` enables poll for
> > >>  conversion completion (normal power only) by generating read cycles on the bus
> > >>  after conversion starts. In parasite power mode this feature is not available.
> > >> -Feature bit masks may be combined (OR).
> > >> +Feature bit masks may be combined (OR). See accompanying sysfs documentation:
> > >> +:ref:`Documentation/w1/slaves/w1_therm.rst <w1_therm>`
> > >> +  
> > 
> > > As warned by Sphinx, this cross-reference is broken:  
> > 
> > >         .../Documentation/w1/slaves/w1_therm.rst:125: WARNING:
> > > undefined label: w1_therm (if the link has no caption the label must precede a section header)  
> > 
> > Would this be ok?
> 
> Yeah, sure!
> 
> > 
> > "More details in Documentation/ABI/testing/sysfs-driver-w1_therm"
> > 
> > > Not sure what you wanted to point here.  
> > 
> > A link to a driver's sysfs interface, but sysfs docs are text
> > files and seem to not be included in Sphynx Docs.
> 
> I sent upstream sometime ago a patch series adding ABI to Sphinx, but I 
> was not merged, not sure why:
> 
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=abi_patches_v5.6

I think the raft of different patches floating around at the time made
me totally confused as to what was, and was not, the latest versions.

I'll be glad to look at them again, if you want to rebase after 5.10-rc1
is out and resend them, as I think this should be showing up in the
documentation.

thanks,

greg k-h
