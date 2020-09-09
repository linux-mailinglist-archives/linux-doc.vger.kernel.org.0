Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 967102634D4
	for <lists+linux-doc@lfdr.de>; Wed,  9 Sep 2020 19:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgIIRmW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Sep 2020 13:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgIIRmW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Sep 2020 13:42:22 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0F7C061573
        for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2020 10:42:21 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 82F3C844;
        Wed,  9 Sep 2020 17:42:21 +0000 (UTC)
Date:   Wed, 9 Sep 2020 11:42:20 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Barry Song <song.bao.hua@hisilicon.com>
Cc:     <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation: core-api/cpu_hotplug: fix a typo
Message-ID: <20200909114220.5983399c@lwn.net>
In-Reply-To: <20200904101902.29560-1-song.bao.hua@hisilicon.com>
References: <20200904101902.29560-1-song.bao.hua@hisilicon.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 4 Sep 2020 22:19:02 +1200
Barry Song <song.bao.hua@hisilicon.com> wrote:

> fourV CPUs should be four CPUs.
> 
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  Documentation/core-api/cpu_hotplug.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
> index 298c9c8..a2c96be 100644
> --- a/Documentation/core-api/cpu_hotplug.rst
> +++ b/Documentation/core-api/cpu_hotplug.rst
> @@ -30,7 +30,7 @@ which didn't support these methods.
>  Command Line Switches
>  =====================
>  ``maxcpus=n``
> -  Restrict boot time CPUs to *n*. Say if you have fourV CPUs, using
> +  Restrict boot time CPUs to *n*. Say if you have four CPUs, using
>    ``maxcpus=2`` will only boot two. You can choose to bring the
>    other CPUs later online.

Applied, thanks.

jon
