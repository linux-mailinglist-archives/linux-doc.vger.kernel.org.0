Return-Path: <linux-doc+bounces-86616-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEpkEE1W/2mo4wAAu9opvQ
	(envelope-from <linux-doc+bounces-86616-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 17:44:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C021A5005C6
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 17:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CF8B30115A0
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 15:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F782D7D3A;
	Sat,  9 May 2026 15:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F77lzqdu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3171319067C
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778341404; cv=none; b=Fo79MODXQ+Lyeyb41tlOLHRNXq/H30/NmtP71yfFzubnKPkmkIbNAnUkXVC/9sAohoXySA3qzvLtNpbPpZsSowHEdnoF6iNi4AluRb8vmR9uVeItYYiwZWNmPOqmwZgWJDTw59ReUFxBmVbNDQ1z+RMfKjkCDSzdXToH6FpxLP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778341404; c=relaxed/simple;
	bh=qZ3p5AG2+MACCsXmmyx9bg5RSvxC92SkrO3C4EqJL4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rhn4G9GraCtX4siTwCrx5j9pwqb2Ot5GJNBPaS0d/TMt3Z63IdFH5W02+c1b3qmSVfTkEu4ly613tokTOkFX/wYhiCgW9mjVGaFTF6KoYh8ZZ/9nLm+eOdW/w0pvv3nHw4pBmzv2SV5ehRskAMePofxt6IBREpKkwrkAVfEljWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F77lzqdu; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so1133683a12.0
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2026 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778341402; x=1778946202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ghf+v/bXUU4Mfzw7RTvk8pkjl1aXFl87yvIP3L5ZJ+0=;
        b=F77lzqduSXaCzkqppunuhkbKlEIKa6M8smnJHaGaIeawaQ7Tkg+B8Ujl7fEhuaXf5i
         mATerutVvxE4sZcnKlQ2MzkUbGF/Q3jP4ESkwTMB9KLr1U6Se9zpd/EZjECrClop9GdR
         NNXnsUOrWzqLfBpKi7jbm+EHAQDC2ZlLdBBn9w2/0x/HV9yA+BS+gMatuuSJQ7KkZime
         nw404u+C62tO4s/yu9iZj4ZgDR1rNw+o9YGSiY54MGXHFQYrucqKHVo3dvDtSJqIHyp5
         /o2XP75xiVPP//33boPFp0N0ewJVpyu++hiLlMQBA3kcvTZ2j9NIb5PdQROPg8iE9YNu
         3R0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778341402; x=1778946202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ghf+v/bXUU4Mfzw7RTvk8pkjl1aXFl87yvIP3L5ZJ+0=;
        b=MTKBJHhqwbmrB2t0noddQuGHhu6RgHGLikQstcfbbic1O89EKrTmPovHNHR26XaxE/
         8/gd7vBxJl2atTm+PvSVuPQJVQ+MwC6Fy6j2Du5UGkeTmfIDOQ02CAL8q7lQxoFvmBTh
         fnvMg2GZgHmZtsSJ0sEGNmgJUIw/UqlMwfJdb2pv/EN2qYVHoML6xNHKxE9h/vC1NMuE
         dGAnRy5BmxZp1e9oSxCA4KQgZR1JON+FJ9ckoeujjg/LpkqFRPXuZ6UCUAMo1ZFo9ZA4
         HOuR2SAO5cQzm/4oIIRD60+ETwIfCMCDKpOYAnxc6EevrSl3FwaujEn1gMMLIz6li+0g
         u3bg==
X-Forwarded-Encrypted: i=1; AFNElJ/Gp/SXqSspQtkNci2YpeE7/YGDOhFzrvDoZtialLz/1fhVt8wMRyE6dJMvUoWPTx70lioLV/TgBKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxmVCDydSHy4cdrjAmWM/Pvk/MTDVB7xZ1TEcReT4ZF2DoKjzk
	ZbB/lmMzwIuvgzmBvgEgpNTAecSxEM8nOYF3LoJQ+U6dyteiNCW0tNwJ
X-Gm-Gg: Acq92OFxSta0PMsUv+YGIp4G0If6W36ifh+aM8wMWxLBPlVKMD2qn3qG47K0aLzC8dQ
	vxpE+LG2ETnNuoSu01apeA9oAcSecZgeZHV8gZtgy3Hm/AscxNTvwRixYhQYPNoV6vy8VdzCxUH
	UDb9c6/Sdl1axtaxZWR4wwn5UNOE5n0I2ktB9w3nmo6axvrMaIRqVCWLfI6GrzUx63qIOUWzTU1
	CZPBPgGSKDSKIhC3aPw9SXt6ivIxWZegeGfWcCkjx8RP14FKLKVsZhvDdVzHMmJky43Yt5HFNmM
	Qz5cfMfOurJtXVTsh4wP4VELZHCXAb9qdVXZI7tLBMtDb47YAg0sqVd/ne7l3PRAUEYOCpRevWO
	go93j+6fMFiYsWAkZSyIHDEz7W+0gJZlh1n7s6DvkeQ67NT+kyxpRLAas3m4AsWlfu32hF1f+ZN
	Hi2O4d8pkwOv8qyAKEfs0ephHMiz0Lj5lMFEaE
X-Received: by 2002:a05:6a20:7fa7:b0:398:b433:87ed with SMTP id adf61e73a8af0-3aab17e8acemr8336221637.44.1778341402483;
        Sat, 09 May 2026 08:43:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767be49sm4686725a12.3.2026.05.09.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 08:43:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 9 May 2026 08:43:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@weissschuh.net, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 RESEND] hwmon: add driver for ARCTIC Fan Controller
Message-ID: <839d67bb-79fe-4096-965f-ead57112b3a3@roeck-us.net>
References: <20260508064405.38676-1-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508064405.38676-1-aureo.serrano@arctic.de>
X-Rspamd-Queue-Id: C021A5005C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-86616-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 02:44:00PM +0800, Aureo Serrano de Souza wrote:
> Add hwmon driver for the ARCTIC Fan Controller, a USB HID device
> (VID 0x3904, PID 0xF001) with 10 fan channels. Exposes fan speed in
> RPM (read-only) and PWM duty cycle (0-255, read/write) via sysfs.
> 
> The device pushes IN reports at ~1 Hz containing RPM readings. PWM is
> set via OUT reports; the device applies the new duty cycle and sends
> back a 2-byte ACK (Report ID 0x02). The driver waits up to 1 s for
> the ACK using a completion. Measured device latency: max ~563 ms over
> 500 iterations. PWM control is manual-only: the device never changes
> duty cycle autonomously.
> 
> raw_event() may run in hardirq context, so fan_rpm[] is protected by
> a spinlock with irq-save. pwm_duty[] is also protected by this spinlock
> because reset_resume() clears it outside the hwmon core lock. The OUT
> report buffer is built and write_pending is armed under the same lock so
> that no reset_resume() can race with the pwm_duty[] snapshot. priv->buf
> is exclusively accessed by write(), which the hwmon core serializes.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

I guess we can live with the potential 1-second sysfs read stall on driver
unload reported by Sashiko. Applied.

Thanks,
Guenter

