Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1AA1D580A
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2020 19:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgEORfd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 May 2020 13:35:33 -0400
Received: from ms.lwn.net ([45.79.88.28]:53462 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726023AbgEORfd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 15 May 2020 13:35:33 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E4CD172D;
        Fri, 15 May 2020 17:35:32 +0000 (UTC)
Date:   Fri, 15 May 2020 11:35:31 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Kevin Hao <haokexin@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: vm: page_frags.rst: Fix the reference of stale
 function
Message-ID: <20200515113531.4cc5e127@lwn.net>
In-Reply-To: <20200508140924.18220-1-haokexin@gmail.com>
References: <20200508140924.18220-1-haokexin@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  8 May 2020 22:09:24 +0800
Kevin Hao <haokexin@gmail.com> wrote:

> The __netdev_alloc_frag() has been dropped by commit 7ba7aeabbaba ("net:
> Don't disable interrupts in napi_alloc_frag()"). So replace it with
> netdev_alloc_frag().
> 
> Signed-off-by: Kevin Hao <haokexin@gmail.com>

Applied, thanks.

It would be nice if that document used the normal function() notation
(with parentheses), oh well...

jon
