Return-Path: <linux-doc+bounces-96767-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 70/tHzRKVmqx2wAAu9opvQ
	(envelope-from <linux-doc+bounces-96767-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 16:39:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39981755F55
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 16:39:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=E9xwor7f;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96767-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96767-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FCAB300DD50
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 14:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E43371880;
	Tue, 14 Jul 2026 14:33:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE79386573
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 14:33:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039601; cv=none; b=V7x9WsL8V1+sEqcaeHVEAPvNTwiy+GMXdA5plKP/yj43M4IaBqUY9b0PKMeNljerpo/c8HdaUOeQ7O+HI1cDpkj1Kq8cjsaewwVvhiAAAYNwkOWHe1koBuUZyaq0QzGIdXsfYbfT/1RsIlkmw6bpAivzd7sPPoEHofaHqnGxkZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039601; c=relaxed/simple;
	bh=SUP1kQE5p1aa+G20qYy1Hucdars0a6q884T9xd3sclY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N922wBNvTkIV2A9lUtGlr1JLy/Hced/ou2FNyjvgIqVR5pPBxmWOB+ZOaTztNF9Qnxhc51JRwZFU6tCDk8y4X1R7bh3Ad42V6Cz5o8Z+0y9EHI9GhY80N5kEZq9WLucTuQKM9zTG5dlYo/rp0jEr33EI3JdPhqJJNQ0+1gqf+WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9xwor7f; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47640541585so2104550f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784039596; x=1784644396; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCR2ojKh9CG9hna9RsCPgdIHB0rwbpF+LXlEWMO+i64=;
        b=E9xwor7fHrqQo54tObeJ34KzvDtNJnxqqFeEU1Mf5tYNN9LFWa6dS53TlkFb1I1AxI
         xAbTYx773b0pYJvOCgh0yrAijuHmzVygJkefC4Ik/Cd5et49KCPEYRYbCM2Klf0WrU5F
         xSn3E2I9jJCFUmwzDwuWa1IAhdBUDV+snGZlVsvNIPlBKNpVu/FSHf8v0JkvlxlG83n5
         5my4Lti/Ajw11pNzNCVEjoy/yUhf4ASxCuguoQWUyEEvkZc/UJFSd36YPFZXkJYnSjmv
         KdbQPkQlUubJ+lXCnfTZBK3nG8l+KHB/UToE+jocwtN/yXKrb0Avu5nEpJLtItdWa4Yf
         TAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784039596; x=1784644396;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BCR2ojKh9CG9hna9RsCPgdIHB0rwbpF+LXlEWMO+i64=;
        b=D4eFIiQBieTpjnrigATw4a8vY+JeQKS+0MP1vABEQNtOhEq7SpthXgHFI4TijT9lUU
         LB9AMasUcwRmNUa1JN23TxPaJi855l69f9SwKaaXubxqvnUFx+T1G9DQEmLquE5Q9hsE
         v1xBiZ++doVtLqUyvvWVx1nuKVKeCG7KqXur6/fBCFsNklBTUi9Su/g9Q0ezYJx2MxI1
         Hr53o/N7GFb9+V/un1IqJYIdR8GluVYtJJt8XJvxi9vH9bMC4cXjo9Vpf2nTgWQ4rAsA
         sfVEzBgxLh3HTcjgDNmk5IbKU0sUNWlp8FLbEAi4UadcsqGl53vDDwmt+DkQNzXsqW7s
         IAjg==
X-Forwarded-Encrypted: i=1; AHgh+RrusSo71CJS/gAQhq/7TR88P1LvgtBQIgc8WEVQffK4o3rESh4qNIfFFX+H65kquegG4Kl1Ush6LCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx6TzXa63iMQr5SBzZmHoZ/fbiPqA+rJOT7CMA7lvdqWupYb49
	0qlJC802zEePAN9jJQ1AdDSDk5ryjEU49uZdehvIF2pa82+WBbnJKbx7
X-Gm-Gg: AfdE7cnhrebsabVF4+dDATZDC2TfmaeIiRsh1Yf/FxrfnFG4QzIMSiQrhVQsV8HFjEF
	n3mCBCJ8dUXKdWegB/uUsS3qbeEvP9NCSj13gzC7ul+2z3tDeYdO4ok4LRljX+3SLinrJSCOG93
	bAGauvnKdEFMU0O1HLk3fFT6AhamcHEimax0zo5NNyQ0prQA+IKMGq/vsKCaNsgTVotQR/7jLJE
	4X5NzPJjTJvxm5XLkEcjiJI3keHi9wXD4/a7PQtJ0erIQ4jT6v6HkoBMimoDJLx73jYek319IWV
	+ADl6OnORyT6G1KVGFyKlZYidtGIV+6QhAoACABJDu9OYeo/LjrWVETi1tLXMU307hOMc0vy7NW
	uxPLkkq27bPQdDH7kkhoqQB/crPEkWTQeql341o0ZkhPvwvrA/bO15Any3yN3Fv0rxYvToZRTc6
	QyYttkebTEz3an8vZYiH3akjpJisc=
X-Received: by 2002:a5d:64c7:0:b0:466:6d18:ae93 with SMTP id ffacd0b85a97d-47f2dcb7453mr15499691f8f.21.1784039595520;
        Tue, 14 Jul 2026 07:33:15 -0700 (PDT)
Received: from NSA-L02.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm8599276f8f.33.2026.07.14.07.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:33:15 -0700 (PDT)
Date: Tue, 14 Jul 2026 16:33:11 +0200
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Janani Sunil <janani.sunil@analog.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, jananisunil.dev@gmail.com
Subject: Re: [PATCH 3/6] iio: adc: adi-axi-adc: Add support for CRC
Message-ID: <4mtugzv3q72yizfw62b2ijjrwi7r2hro2fbjljeziuotyhuod3@6waqlwzufruh>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-3-44e1194fd96a@analog.com>
 <20260710014617.323acf6e@jic23-huawei>
 <ucrlt75xiwbv3rrc4gvgdop24u54eizhuqzf2av2qsa6ceymdp@kfkuiwuvakhl>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ucrlt75xiwbv3rrc4gvgdop24u54eizhuqzf2av2qsa6ceymdp@kfkuiwuvakhl>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96767-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[nonamenuno@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[analog.com,baylibre.com,kernel.org,foss.st.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[6waqlwzufruh:mid,analog.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39981755F55

On Tue, Jul 14, 2026 at 04:18:24PM +0200, Nuno Sá wrote:
> On Fri, Jul 10, 2026 at 01:46:17AM +0100, Jonathan Cameron wrote:
> > On Thu, 9 Jul 2026 10:50:14 +0200
> > Janani Sunil <janani.sunil@analog.com> wrote:
> > 
> > > Add support for enabling and disabling Cyclic Redundancy Check (CRC)
> > > processing in the AXI ADC backend. CRC provides data integrity verification
> > > for high-speed ADC data streams, ensuring reliable data transfer between
> > > the ADC frontend and backend processing systems.
> > > 
> > > Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> > The 'other things' I found bit from Sashiko is interesting. Far as I can
> > tell it is right and [devm_]mutex_init() is missing for lock
> > in struct adi_axi_adc_state().  
> > 
> 
> Ouch! Yes, I was also wondering about the lock comment.
> 
> > Nuno, looks like it was from:
> > 7ecb8ee5c93b ("iio: adc: adi-axi-adc: support digital interface calibration")
> > 
> > Which indeed adds the lock with a mutex_init()
> 
> You mean without :)?
> 
> I'll send a patch fixing it!

Actually, to make it easier, Janani will include the fix in v2.

- Nuno Sá

> - Nuno Sá
> > 
> > Jonathan
> > 
> > >  static const struct iio_backend_info adi_axi_adc_generic = {
> > > 
> > 

