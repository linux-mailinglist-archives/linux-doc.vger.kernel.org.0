Return-Path: <linux-doc+bounces-820-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B63C7D34B3
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 13:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C814EB20C39
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 11:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037AF16409;
	Mon, 23 Oct 2023 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h/G7ygAo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TfEkAPS+"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7FD16405
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 11:42:12 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC101733;
	Mon, 23 Oct 2023 04:41:49 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9C376218E0;
	Mon, 23 Oct 2023 11:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1698061300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q3h7bYkmxNuybyYNDcveX5DD2P/BKzeu6mm/kPPgPdU=;
	b=h/G7ygAoWyM5zG8eKGcVm8HrcWPzEDEivri0BJSGDEgVhXNBapQpqLSY/8WomkLmxcWnPW
	Qd/etiyPEqAW5IiWxf5u3MHWyFl6LJVnk1+HZFFADVEBlP4wT4UihwYeIKatbtOywQW/Ot
	59VmbHbqJsX44/2IWsJWPT+BxFhrie8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698061300;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q3h7bYkmxNuybyYNDcveX5DD2P/BKzeu6mm/kPPgPdU=;
	b=TfEkAPS+RDAVdr1D6jh0FO7uRl0fz6n7JS5sAVCpeRIX8ZVWMqM1dosMUdnVhvssKVsGwC
	bSetY7o4jXdTWfDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 55407139C2;
	Mon, 23 Oct 2023 11:41:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Q2VGE/RbNmWTDQAAMHmgww
	(envelope-from <jdelvare@suse.de>); Mon, 23 Oct 2023 11:41:40 +0000
Date: Mon, 23 Oct 2023 13:41:39 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] eeprom: remove doc and MAINTAINERS section after driver
 was removed
Message-ID: <20231023134139.66e95a04@endymion.delvare>
In-Reply-To: <20231012042834.6663-1-lukas.bulwahn@gmail.com>
References: <20231012042834.6663-1-lukas.bulwahn@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.75
X-Spamd-Result: default: False [-3.75 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-1.15)[88.68%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 HAS_ORG_HEADER(0.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,gmail.com,lwn.net,vger.kernel.org]

On Thu, 12 Oct 2023 06:28:34 +0200, Lukas Bulwahn wrote:
> Commit 0113a99b8a75 ("eeprom: Remove deprecated legacy eeprom driver")
> already removes the eeprom driver's code.
> 
> Remove also the eeprom driver's documentation and MAINTAINERS section.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Greg, please pick this patch into your -next char and misc tree on top
> of the commit above.
> 
>  Documentation/misc-devices/eeprom.rst | 107 --------------------------
>  Documentation/misc-devices/index.rst  |   1 -
>  MAINTAINERS                           |   6 --
>  3 files changed, 114 deletions(-)
>  delete mode 100644 Documentation/misc-devices/eeprom.rst
> (...)

Probably too late, but anyway:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support

