Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17DE0263514
	for <lists+linux-doc@lfdr.de>; Wed,  9 Sep 2020 19:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgIIRze (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Sep 2020 13:55:34 -0400
Received: from ms.lwn.net ([45.79.88.28]:58720 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725974AbgIIRzd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 9 Sep 2020 13:55:33 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 96F3B844;
        Wed,  9 Sep 2020 17:55:33 +0000 (UTC)
Date:   Wed, 9 Sep 2020 11:55:32 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     anton.ivanov@cambridgegreys.com
Cc:     linux-um@lists.infradead.org, linux-doc@vger.kernel.org,
        richard@nod.at
Subject: Re: [PATCH v2] docs: add a new User Mode Linux HowTo
Message-ID: <20200909115532.42a96ddc@lwn.net>
In-Reply-To: <20200907092124.17599-1-anton.ivanov@cambridgegreys.com>
References: <20200907092124.17599-1-anton.ivanov@cambridgegreys.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  7 Sep 2020 10:21:24 +0100
anton.ivanov@cambridgegreys.com wrote:

Sorry, I'd missed the fact that there's a v2; my comments from v1 still
apply, though, it seems.

> diff --git a/Documentation/virt/uml/user_mode_linux.rst b/Documentation/virt/uml/user_mode_linux-2.4.rst
> similarity index 99%
> rename from Documentation/virt/uml/user_mode_linux.rst
> rename to Documentation/virt/uml/user_mode_linux-2.4.rst
> index de0f0b2c9d5b..ed5a698cd710 100644
> --- a/Documentation/virt/uml/user_mode_linux.rst
> +++ b/Documentation/virt/uml/user_mode_linux-2.4.rst
> @@ -10,6 +10,10 @@ User Mode Linux HOWTO
>  This document describes the use and abuse of Jeff Dike's User Mode
>  Linux: a port of the Linux kernel as a normal Intel Linux process.
>  
> +*Note: - this howto is historic and correct as of kernel versions
> +~ 2.4. For more up-to-date information please refer to the newer
> +user_mode_linux_howto_v2.*

So why are we keeping this version around?  The 5.x kernel doesn't need to
document what was happening in 2.4... ?

Thanks,

jon
