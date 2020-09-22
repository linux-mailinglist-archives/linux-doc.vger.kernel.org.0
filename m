Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C035A274709
	for <lists+linux-doc@lfdr.de>; Tue, 22 Sep 2020 18:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgIVQ5B (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Sep 2020 12:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgIVQ5B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Sep 2020 12:57:01 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A384C061755
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2020 09:57:01 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3A2EA2E5;
        Tue, 22 Sep 2020 16:56:59 +0000 (UTC)
Date:   Tue, 22 Sep 2020 10:56:56 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Matthew Wilcox <willy@infradead.org>, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [PATCH RFC] Make the docs build "work" with Sphinx 3.x
Message-ID: <20200922105656.11043bd9@lwn.net>
In-Reply-To: <87sgbaqnp9.fsf@intel.com>
References: <20200904102925.52fcd2a1@lwn.net>
        <20200921222639.GY32101@casper.infradead.org>
        <87sgbaqnp9.fsf@intel.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 22 Sep 2020 10:23:46 +0300
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> > Should we be converting the kernel-doc script to output 3.0-style markup
> > for structs?  
> 
> IIUC it's not backwards compatible with Sphinx pre-3.0, so you'd either
> have to require Sphinx 3.0 or have kernel-doc emit both, depending on
> the Sphinx version.

Certainly before requiring 3.0 we should, like, actually make it work with
3.0...  People with time to do that appear to be rather scarce at the
moment, though.  I'll get to it eventually but I have a few other things
on my plate as well.

jon
