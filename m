Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E962B52B1
	for <lists+linux-doc@lfdr.de>; Mon, 16 Nov 2020 21:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727743AbgKPUfR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 16 Nov 2020 15:35:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:56778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbgKPUfR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 16 Nov 2020 15:35:17 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 716A420782;
        Mon, 16 Nov 2020 20:35:16 +0000 (UTC)
Date:   Mon, 16 Nov 2020 15:35:14 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20201116153514.6e4b2c6e@gandalf.local.home>
In-Reply-To: <20201116132929.7f59943e@lwn.net>
References: <20201116173502.392a769c@canb.auug.org.au>
        <20201116124338.76a522e1@gandalf.local.home>
        <20201116122432.796af13b@lwn.net>
        <20201116152552.11572354@gandalf.local.home>
        <20201116132929.7f59943e@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 16 Nov 2020 13:29:29 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> > Would something like the below work? I think I fixed the other places with
> > issues and for consistency, replaced the ".. code-block:: c" with just "::"
> > usage throughout the file.  
> 
> That will work.  It will also have the effect of removing C syntax
> highlighting from the formatted output; that is fine with me, but others
> are more attached to it.

Is there a way to set a default highlighting to be C syntax?

Otherwise I'll just put it back and add the code-block statements back in,
even though there are those that will complain about the added mark up ;-)

-- Steve
