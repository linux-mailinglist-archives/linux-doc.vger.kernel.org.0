Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80790CDC45
	for <lists+linux-doc@lfdr.de>; Mon,  7 Oct 2019 09:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfJGHMb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Oct 2019 03:12:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:50132 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726889AbfJGHMb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 Oct 2019 03:12:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id F2E4BAE12;
        Mon,  7 Oct 2019 07:12:29 +0000 (UTC)
Message-ID: <1570432347.6057.4.camel@suse.de>
Subject: Re: [PATCH] hwmon: docs: Extend inspur-ipsps1 title underline
From:   Jean Delvare <jdelvare@suse.de>
To:     Adam Zerella <adam.zerella@gmail.com>
Cc:     corbet@lwn.net, linux@roeck-us.net, linux-doc@vger.kernel.org
Date:   Mon, 07 Oct 2019 09:12:27 +0200
In-Reply-To: <20191007023657.GA24341@gmail.com>
References: <20191007023657.GA24341@gmail.com>
Organization: Suse Linux
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2019-10-07 at 13:36 +1100, Adam Zerella wrote:
> Sphinx is generating a build warning as the title underline
> of this file is too short.
> 
> Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
> ---
>  Documentation/hwmon/inspur-ipsps1.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/inspur-ipsps1.rst b/Documentation/hwmon/inspur-ipsps1.rst
> index 2b871ae3448f..292c0c26bdd1 100644
> --- a/Documentation/hwmon/inspur-ipsps1.rst
> +++ b/Documentation/hwmon/inspur-ipsps1.rst
> @@ -1,5 +1,5 @@
>  Kernel driver inspur-ipsps1
> -=======================
> +===========================
>  
>  Supported chips:
>  

Good catch.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
