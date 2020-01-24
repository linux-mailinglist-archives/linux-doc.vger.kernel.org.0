Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B51FD148B99
	for <lists+linux-doc@lfdr.de>; Fri, 24 Jan 2020 16:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730779AbgAXP7h (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Jan 2020 10:59:37 -0500
Received: from mx2.suse.de ([195.135.220.15]:54698 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727306AbgAXP7h (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 24 Jan 2020 10:59:37 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id BB009AC5C;
        Fri, 24 Jan 2020 15:59:35 +0000 (UTC)
Date:   Fri, 24 Jan 2020 16:59:33 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 27/28] docs: i2c: i2c-protocol: use same wording as
 smbus-protocol
Message-ID: <20200124165933.2613b3a0@endymion>
In-Reply-To: <20200123145626.8102-14-luca@lucaceresoli.net>
References: <20200123135103.20540-1-luca@lucaceresoli.net>
        <20200123145626.8102-1-luca@lucaceresoli.net>
        <20200123145626.8102-14-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 23 Jan 2020 15:56:25 +0100, Luca Ceresoli wrote:
> In smbus-protocol.rst we use the text "Implemented by" for the same meaning
> as "This corresponds to". Change everything to "Implemented by" for
> coherency.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reported-by: Jean Delvare <jdelvare@suse.de>
> 
> ---
> 
> This patch is new in v2.
> ---
>  Documentation/i2c/i2c-protocol.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/i2c/i2c-protocol.rst b/Documentation/i2c/i2c-protocol.rst
> index 6aafc3880bce..b2092f8f815d 100644
> --- a/Documentation/i2c/i2c-protocol.rst
> +++ b/Documentation/i2c/i2c-protocol.rst
> @@ -28,7 +28,7 @@ Count (8 bits)  A data byte containing the length of a block operation.
>  Simple send transaction
>  =======================
>  
> -This corresponds to i2c_master_send()::
> +Implemented by i2c_master_send()::
>  
>    S Addr Wr [A] Data [A] Data [A] ... [A] Data [A] P
>  
> @@ -36,7 +36,7 @@ This corresponds to i2c_master_send()::
>  Simple receive transaction
>  ==========================
>  
> -This corresponds to i2c_master_recv()::
> +Implemented by i2c_master_recv()::
>  
>    S Addr Rd [A] [Data] A [Data] A ... A [Data] NA P
>  
> @@ -44,7 +44,7 @@ This corresponds to i2c_master_recv()::
>  Combined transactions
>  =====================
>  
> -This corresponds to i2c_transfer().
> +Implemented by i2c_transfer().
>  
>  They are just like the above transactions, but instead of a stop
>  condition P a start condition S is sent and the transaction continues.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
