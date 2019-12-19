Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68B5D1266C2
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2019 17:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbfLSQYX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 19 Dec 2019 11:24:23 -0500
Received: from ms.lwn.net ([45.79.88.28]:37068 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726776AbfLSQYX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Dec 2019 11:24:23 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A7EAD382;
        Thu, 19 Dec 2019 16:24:22 +0000 (UTC)
Date:   Thu, 19 Dec 2019 09:24:21 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Greg KH <greg@kroah.com>
Cc:     tglx@linutronix.de, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Process: provide hardware-security list details
Message-ID: <20191219092421.03e970cb@lwn.net>
In-Reply-To: <20191209193524.GA1694922@kroah.com>
References: <20191209192611.GA1688548@chatter.i7.local>
        <20191209193524.GA1694922@kroah.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 9 Dec 2019 20:35:24 +0100
Greg KH <greg@kroah.com> wrote:

> On Mon, Dec 09, 2019 at 02:26:11PM -0500, Konstantin Ryabitsev wrote:
> > Fill in "..." stubs with proper links to the mailing lists's encryption
> > keys and service description URLs. Similarly, fix wording to specify
> > that multiple members of Linux Foundation's IT team have access to
> > internal kernel.org infrastructure, and that all of them have similar
> > confidentiality obligations as the IT team director.
> > 
> > Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>  
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
I've applied this, thanks.

jon
