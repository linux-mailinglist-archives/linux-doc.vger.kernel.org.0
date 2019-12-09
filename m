Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B31451175FE
	for <lists+linux-doc@lfdr.de>; Mon,  9 Dec 2019 20:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfLITf0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 Dec 2019 14:35:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:45446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726602AbfLITf0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Dec 2019 14:35:26 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E791A20637;
        Mon,  9 Dec 2019 19:35:25 +0000 (UTC)
Date:   Mon, 9 Dec 2019 20:35:24 +0100
From:   Greg KH <greg@kroah.com>
To:     corbet@lwn.net, tglx@linutronix.de, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Process: provide hardware-security list details
Message-ID: <20191209193524.GA1694922@kroah.com>
References: <20191209192611.GA1688548@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209192611.GA1688548@chatter.i7.local>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 09, 2019 at 02:26:11PM -0500, Konstantin Ryabitsev wrote:
> Fill in "..." stubs with proper links to the mailing lists's encryption
> keys and service description URLs. Similarly, fix wording to specify
> that multiple members of Linux Foundation's IT team have access to
> internal kernel.org infrastructure, and that all of them have similar
> confidentiality obligations as the IT team director.
> 
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
