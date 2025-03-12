Return-Path: <linux-doc+bounces-40612-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F9AA5DC04
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 12:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3101E17A5A6
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 11:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D59223F422;
	Wed, 12 Mar 2025 11:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iQpwXeaU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SPqk3W/n";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iQpwXeaU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SPqk3W/n"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301BB23F38F
	for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741780297; cv=none; b=oHnUscidz7t1fs/0n3o/OstpajjyFtalk68hhpJ9l1b7Hcgj79AIs7C+4IbWkEnDFQxFzb71wK1/upvhxBUH2rMkSb9OsDL7fl0sN8OFtDORrjwwoNCtCe1kudzBe4Z8AGYRU7T+LIHE4zcuuARJOiOYTsBOpJexsLvOUQJaIuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741780297; c=relaxed/simple;
	bh=Z7kvbyisWQFg8HQDq33NrZL70N8qhXbciYh2nKt6azQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N53gb0usuMHuTKTtQSJqsw+XrVBLK7tdz4Xn7x7kWIzluOx3KdjGmyJkm+jT1+ougFdmB+1060oY7xwqhZLZePz2581jbjLIFrC77gVAoekR6HWZVdkIfellzo6F4EWxvO3per3fyNl0+US8B5xr0Lxb28dZOTobW8ZoA5VyAAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iQpwXeaU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SPqk3W/n; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iQpwXeaU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SPqk3W/n; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4AB4A21175;
	Wed, 12 Mar 2025 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741780294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CpBiJ+HSSLjjF5oMf0zVhlRwsujc/v5f3ZNcDCxcajI=;
	b=iQpwXeaU3/HKmvXJJZUfyaGmxuS4s/7DE+erYHUXL4YxJH8TS+W4SUVb/AJe5/qXGRLTqk
	j1FjkY2eYAKTRHb8dCZzx6BsL5WebyxZuOLpQFhrs6+7IzWT1v5lXN2B2NxhviZ50ImjJw
	BguOgs0SMU12Ikj6UaA2jhPLPWinxj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741780294;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CpBiJ+HSSLjjF5oMf0zVhlRwsujc/v5f3ZNcDCxcajI=;
	b=SPqk3W/nklxLKb2oMO6KuMNi+TCim6A6lkkP7f+GKy8hIU/5GFkAtdp4pV2qIyQ4DR+1xO
	PelX6pgMI5EMwiBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741780294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CpBiJ+HSSLjjF5oMf0zVhlRwsujc/v5f3ZNcDCxcajI=;
	b=iQpwXeaU3/HKmvXJJZUfyaGmxuS4s/7DE+erYHUXL4YxJH8TS+W4SUVb/AJe5/qXGRLTqk
	j1FjkY2eYAKTRHb8dCZzx6BsL5WebyxZuOLpQFhrs6+7IzWT1v5lXN2B2NxhviZ50ImjJw
	BguOgs0SMU12Ikj6UaA2jhPLPWinxj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741780294;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CpBiJ+HSSLjjF5oMf0zVhlRwsujc/v5f3ZNcDCxcajI=;
	b=SPqk3W/nklxLKb2oMO6KuMNi+TCim6A6lkkP7f+GKy8hIU/5GFkAtdp4pV2qIyQ4DR+1xO
	PelX6pgMI5EMwiBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B43261377F;
	Wed, 12 Mar 2025 11:51:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id adRWKkV10WeEQgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 12 Mar 2025 11:51:33 +0000
Message-ID: <be2f49b5-dcdc-4954-b650-90670dfa70b9@suse.de>
Date: Wed, 12 Mar 2025 12:51:33 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/appletbdm: use %p4cl instead of %p4cc
To: Aditya Garg <gargaditya08@live.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>, "airlied@redhat.com"
 <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>, "joe@perches.com"
 <joe@perches.com>, "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
References: <ABAEA9D0-97CB-4ADD-9606-A12D5815335A@live.com>
 <33F3F7E2-24AE-4F29-9053-3B502D075BA8@live.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <33F3F7E2-24AE-4F29-9053-3B502D075BA8@live.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[live.com,kodeit.net,kernel.org,redhat.com,ffwll.ch,linux.intel.com,suse.com,goodmis.org,rasmusvillemoes.dk,chromium.org,lwn.net,linux-foundation.org,canonical.com,perches.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,live.com:email,suse.de:mid]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Hi

Am 12.03.25 um 10:06 schrieb Aditya Garg:
> From: Aditya Garg <gargaditya08@live.com>
>
> Due to lack of a proper printk format, %p4cc was being used instead of
> %p4cl for the purpose of printing FourCCs. But the disadvange was that
> they were being printed in a reverse order. %p4cl should correct this
> issue.
>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>   drivers/gpu/drm/tiny/appletbdrm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
> index 703b9a41a..751b05753 100644
> --- a/drivers/gpu/drm/tiny/appletbdrm.c
> +++ b/drivers/gpu/drm/tiny/appletbdrm.c
> @@ -212,7 +212,7 @@ static int appletbdrm_read_response(struct appletbdrm_device *adev,
>   	}
>   
>   	if (response->msg != expected_response) {
> -		drm_err(drm, "Unexpected response from device (expected %p4cc found %p4cc)\n",
> +		drm_err(drm, "Unexpected response from device (expected %p4cl found %p4cl)\n",
>   			&expected_response, &response->msg);

If you want to print out protocol-header tokens, why not use formatting 
macros as we do with DRM mode? There's one for the format string [1] and 
one for the argument. [2] It's not as fancy as the conversion code, but 
you'll get something for your driver that is easily understandable.

[1] 
https://elixir.bootlin.com/linux/v6.14-rc4/source/include/drm/drm_modes.h#L425
[2] 
https://elixir.bootlin.com/linux/v6.14-rc4/source/include/drm/drm_modes.h#L431

Best regards
Thomas

>   		return -EIO;
>   	}
> @@ -286,7 +286,7 @@ static int appletbdrm_get_information(struct appletbdrm_device *adev)
>   	}
>   
>   	if (pixel_format != APPLETBDRM_PIXEL_FORMAT) {
> -		drm_err(drm, "Encountered unknown pixel format (%p4cc)\n", &pixel_format);
> +		drm_err(drm, "Encountered unknown pixel format (%p4cl)\n", &pixel_format);
>   		ret = -EINVAL;
>   		goto free_info;
>   	}

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


