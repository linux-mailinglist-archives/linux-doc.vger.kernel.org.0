Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A812B8137
	for <lists+linux-doc@lfdr.de>; Wed, 18 Nov 2020 16:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgKRPva (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Nov 2020 10:51:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:50562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726234AbgKRPva (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Nov 2020 10:51:30 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2472247A7;
        Wed, 18 Nov 2020 15:51:28 +0000 (UTC)
Date:   Wed, 18 Nov 2020 10:51:27 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] ftrace/documentation: Fix RST C code blocks
Message-ID: <20201118105127.4a7b02ef@gandalf.local.home>
In-Reply-To: <20201118103502.24e90f7c@gandalf.local.home>
References: <20201116173502.392a769c@canb.auug.org.au>
        <20201116124338.76a522e1@gandalf.local.home>
        <20201116122432.796af13b@lwn.net>
        <20201116152552.11572354@gandalf.local.home>
        <20201116132929.7f59943e@lwn.net>
        <20201118103502.24e90f7c@gandalf.local.home>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 18 Nov 2020 10:35:02 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> 
> Some C code in the ftrace-users.rst document is missing RST C block
> annotation, which has to be added.
> 
> Link: https://lore.kernel.org/r/20201116173502.392a769c@canb.auug.org.au
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>

Jon,

You want to take this through your tree?

-- Steve
