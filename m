Return-Path: <linux-doc+bounces-2467-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11F7EDE9C
	for <lists+linux-doc@lfdr.de>; Thu, 16 Nov 2023 11:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC1771F21D31
	for <lists+linux-doc@lfdr.de>; Thu, 16 Nov 2023 10:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E316FBEC;
	Thu, 16 Nov 2023 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="IH1ZtbPT"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EDAD42;
	Thu, 16 Nov 2023 02:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=hATFZBvv9C0tyg+qA91L6v4ZurGsEZYprS7gdv+GBJ8=; b=IH1ZtbPTAuU0WICTCh4llxJigD
	E/G3qGRosmSCagARmbK1UzD/WCTB8v3H/CATKlDAxE2+VOad+/3t89p4RArERBubpIpED6d3i3QVx
	Cow9yH27OMWDCWxDHyiR1Dkfo/41+RFY65o0UsGUORKREvdW1EjViu+TnDMZe7Vj1JL4=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:59436 helo=asus64.hugovil.com)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1r3ZiB-0000sO-Jg; Thu, 16 Nov 2023 05:35:04 -0500
Date: Thu, 16 Nov 2023 05:35:02 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: <git@amd.com>, <michal.simek@amd.com>, <jacmet@sunsite.dk>,
 <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <corbet@lwn.net>, <christophe.leroy@csgroup.eu>, <rdunlap@infradead.org>,
 <airlied@redhat.com>, <ogabbay@kernel.org>, <linux-doc@vger.kernel.org>,
 <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
 <shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>
Message-Id: <20231116053502.a66a6da2a82db94f4cbdb350@hugovil.com>
In-Reply-To: <20231116072915.3338387-3-manikanta.guntupalli@amd.com>
References: <20231116072915.3338387-1-manikanta.guntupalli@amd.com>
	<20231116072915.3338387-3-manikanta.guntupalli@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
Subject: Re: [PATCH V3 2/2] serial: uartlite: Use dynamic allocation for
 major number when uart ports > 4
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Thu, 16 Nov 2023 12:59:15 +0530
Manikanta Guntupalli <manikanta.guntupalli@amd.com> wrote:

Hi,

> Device number 204 has a range of minors on major number.
> uart_register_driver is failing due to lack of minor numbers
> when more number of uart ports used. So, to avoid minor number
> limitation on 204 major number use dynamic major allocation
> when more than 4 uart ports used otherwise use static major
> allocation.
> 
> https://docs.kernel.org/arch/arm/sa1100/serial_uart.html
> 
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> ---
> Changes for V2:
> Update logic to use either static or dynamic major allocation.
> Update commit description.
> Update description of SERIAL_UARTLITE_NR_UARTS in Kconfig.
> Changes for V3:
> Fix typo.
> Remove parentheses.
> ---
>  drivers/tty/serial/Kconfig    | 2 ++
>  drivers/tty/serial/uartlite.c | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 732c893c8d16..c3c82b740078 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -532,6 +532,8 @@ config SERIAL_UARTLITE_NR_UARTS
>  	help
>  	  Set this to the number of uartlites in your system, or the number
>  	  you think you might implement.
> +	  If maximum number of uartlite serial ports are more than 4, then driver uses

"are more" -> "is more"

"then driver" -> "the driver" (or "then the driver")

Hugo.

> +	  dynamic allocation instead of static allocation for major number.
>  
>  config SERIAL_SUNCORE
>  	bool
> diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
> index 404c14acafa5..66d751edcf45 100644
> --- a/drivers/tty/serial/uartlite.c
> +++ b/drivers/tty/serial/uartlite.c
> @@ -24,8 +24,13 @@
>  #include <linux/pm_runtime.h>
>  
>  #define ULITE_NAME		"ttyUL"
> +#if CONFIG_SERIAL_UARTLITE_NR_UARTS > 4
> +#define ULITE_MAJOR             0       /* use dynamic node allocation */
> +#define ULITE_MINOR             0
> +#else
>  #define ULITE_MAJOR		204
>  #define ULITE_MINOR		187
> +#endif
>  #define ULITE_NR_UARTS		CONFIG_SERIAL_UARTLITE_NR_UARTS
>  
>  /* ---------------------------------------------------------------------
> -- 
> 2.25.1
> 


-- 
Hugo Villeneuve <hugo@hugovil.com>

