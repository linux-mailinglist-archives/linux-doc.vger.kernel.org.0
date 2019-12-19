Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E08C1266CD
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2019 17:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfLSQ04 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 19 Dec 2019 11:26:56 -0500
Received: from ms.lwn.net ([45.79.88.28]:37104 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726760AbfLSQ04 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Dec 2019 11:26:56 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9DBF1382;
        Thu, 19 Dec 2019 16:26:55 +0000 (UTC)
Date:   Thu, 19 Dec 2019 09:26:54 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: fix Sphinx warning in xilinx_sdfec.rst
Message-ID: <20191219092654.3e7af300@lwn.net>
In-Reply-To: <8d644cf1-fa7b-ec62-84cf-9b41d7c30eed@infradead.org>
References: <8d644cf1-fa7b-ec62-84cf-9b41d7c30eed@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 8 Dec 2019 20:16:40 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix Sphinx format warning by adding a blank line.
> 
> Documentation/misc-devices/xilinx_sdfec.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Derek Kiernan <derek.kiernan@xilinx.com>
> Cc: Dragan Cvetic <dragan.cvetic@xilinx.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/misc-devices/xilinx_sdfec.rst |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20191209.orig/Documentation/misc-devices/xilinx_sdfec.rst
> +++ linux-next-20191209/Documentation/misc-devices/xilinx_sdfec.rst
> @@ -1,4 +1,5 @@
>  .. SPDX-License-Identifier: GPL-2.0+
> +
>  ====================
>  Xilinx SD-FEC Driver
>  ====================

Applied, thanks.

jon
