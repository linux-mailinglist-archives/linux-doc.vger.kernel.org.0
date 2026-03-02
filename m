Return-Path: <linux-doc+bounces-77538-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKxRJw9cpWlc+QUAu9opvQ
	(envelope-from <linux-doc+bounces-77538-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 02 Mar 2026 10:44:47 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 033701D5B43
	for <lists+linux-doc@lfdr.de>; Mon, 02 Mar 2026 10:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20E5E3008D38
	for <lists+linux-doc@lfdr.de>; Mon,  2 Mar 2026 09:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E72738F62E;
	Mon,  2 Mar 2026 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="g26/D8Jr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9800383C68
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 09:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444660; cv=none; b=pE7lOrSbh/5Ova7ciYZjFOdb/RCWak1uIbUb1PaZVFMMyELgQBRseq4q269X4Ad5yArV2gmjnpcUSsO0X9HSsfSzT6/m2Krf83G4LvanpwL8wE0RsXOUEjWZZiq4g/yAgYAQFDCknFlNV7hPk5FIUtH4gRJ/pRqnxzTkR8dzkTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444660; c=relaxed/simple;
	bh=EdtrS3uxbW5G3jVfOkaPkh4ppghbeIrW97LweZBsfrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZX0hOg0NrzfxrwH8JjFQw49B2YJ9PkCikHcp5uOecztYfG+ro1Et2H2l4tsm2U4dMot0CvTeG+vlvZ0S1jvSzOk/cxV3HDuMkpk1cNM+oJ6l/I368NWCPuwDuzHE8+iC7ydIzuqQ+2eseHUeNkgL5oolVnylPOqvSp1XL38SCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=g26/D8Jr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4833115090dso43073255e9.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 01:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772444657; x=1773049457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tdsnQzzh+Lt1pkN+nCw9kSvCEoqVVH6yGcbrKgciEAs=;
        b=g26/D8JrTLqBOq3QvS83H/OXOOvyQ0pD8LUrvootV47cg41Do/SzN3FliMG8nhE4xV
         FlO+RaB/bE07zF9Q/idTt5hcuGHO6xUtiNiQ6mX1vYFKRUXvVLUPnh8BSBkVXVhCZeWY
         I5xYJsTXr8nO62C/nXP6qcONQzThRAZi4+Dp9+8iWDdFEZUSBugdX41qKKqIGFRjEnRo
         HQ3PZRrmtqZdr1x0zSeeQYF0V/stEwfSAv347dxuv8EklNJAB2XnnhtU0SxRMPxtzIpC
         YQwl7nOFmFlAflxkFH97EcparEMqew3GnnN2MvFUKwu09rmZJ5GWCI8e1HtloyXa4Frh
         oEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444657; x=1773049457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdsnQzzh+Lt1pkN+nCw9kSvCEoqVVH6yGcbrKgciEAs=;
        b=n4CODgiSKTdr8eDm/vOM/MSHBuKi9cEb19efSV1ryZ+uGyqecbMF2ORxy85oARrWv2
         B3G2MhvIagtbQfHzkWPDeB+kMV2P8Q4PeyEVGhXlpHFxR9AvX7NitZM+kjeM6biCwsH4
         kFM/5Plc7v2Dli4v8hopUkjlIxGN5IbWeGIchXzRZliR/B4NlYhZD4/apOTL0zp8p5f5
         7k7sHDcpPzHi/v/wZZEVJewrn/13qiOeMkK8+xiJ81Ulxwsi0SKRhsQ0zA1HmOz2UefK
         W4ujG85caDUmA8hhAh9SwL6ZMdsUYWMZi9tDW2beE2/xDTpAN4H3ECnLaEI2OvR4Bmc7
         V2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3WiZj2W2Itep/xKALxGafvXCNURi2Zt+5lE26/nT9/U55pBJZc8eK/OnfxVMVUDwQaX0dG63dNGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNO0WYndKYF7v6DpjEecVwG87MZifDsoBG3+EMVHbgJ6elxWxG
	aCO8CjeTFjtZ9PUUMKfWt3gEsxI1DxT3f1qeNLU9Ah6iKA8OF81oUvbegS0sMi5smj4=
X-Gm-Gg: ATEYQzy0KKpTEBr/mxloTe2vjeaB2B4oIU+XAyZb9IXdx00+rJ9g3lkHF7h61sVeGXK
	QhueAxecnqeCco9+rUsPJIXUoK3n4oYj4ip0cSgxYX5ruNHopisOW0es05+LPz9UCQXVK/OikZJ
	EFuvdncUywRY0JnrlepPYLNgLD/4uJ4COLx2XOCVehzALNIafjeL+mr1NPwsatn+hb1p+qs1Nm7
	sXzI6+6qm807GhYuFwcJliMJ5H3xWg1Uy3kOjUyudjKqJayGIND/jFw/uothzjKEegLnWdETu++
	Kwl+BzTBsxW4PmULPAi9sEcc6qshJdJhHULeuFJG5hKp1BLjJlT76xzsntvRfaAthOZrU1iFutC
	lrGRM+nRAXnZuGNyj8U9UOsyoJDpOOwXzy7nWdRIeDMnw4+peh1HolypXZGJEMDtSAaE+Ryrv5F
	tkxyeHb4DQ4z2mDR6hq/RHb/MrEsk/684=
X-Received: by 2002:a05:600c:198a:b0:482:ef72:5781 with SMTP id 5b1f17b1804b1-483c9bfa529mr178963245e9.25.1772444657057;
        Mon, 02 Mar 2026 01:44:17 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb85c58sm127994325e9.9.2026.03.02.01.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:44:16 -0800 (PST)
Date: Mon, 2 Mar 2026 10:44:14 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, donald.hunter@gmail.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com, 
	mbloch@nvidia.com, przemyslaw.kitszel@intel.com, mschmidt@redhat.com, 
	andrew+netdev@lunn.ch, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, chuck.lever@oracle.com, matttbe@kernel.org, cjubran@nvidia.com, 
	daniel.zahka@gmail.com, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 06/10] devlink: add devlink_dev_driver_name()
 helper and use it in trace events
Message-ID: <u46fbskiokav5y3mgleamlqoohpiyygnhgjyhxyouctwkfp6ig@tn53kspbmgbz>
References: <20260225133422.290965-1-jiri@resnulli.us>
 <20260225133422.290965-7-jiri@resnulli.us>
 <20260228145805.758ff8c0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228145805.758ff8c0@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77538-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[vger.kernel.org,davemloft.net,google.com,redhat.com,kernel.org,gmail.com,lwn.net,linuxfoundation.org,nvidia.com,intel.com,lunn.ch,goodmis.org,efficios.com,oracle.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,resnulli-us.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 033701D5B43
X-Rspamd-Action: no action

Sat, Feb 28, 2026 at 11:58:05PM +0100, kuba@kernel.org wrote:
>On Wed, 25 Feb 2026 14:34:18 +0100 Jiri Pirko wrote:
>> +const char *devlink_dev_driver_name(const struct devlink *devlink)
>> +{
>> +	struct device *dev = devlink->dev;
>> +
>> +	return dev ? dev->driver->name : NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(devlink_dev_driver_name);
>
>You say we need this in prep for shared instances, which is fair, but
>shared instances should presumably share across the same driver, most
>of the time? So perhaps we should do a similar thing here as you did to
>the bus/dev name? Maybe when shared instance is allocated:
>
>	devlink->driver_name = kasprintf("%s+", dev->driver);
>
>And then:
>
>+const char *devlink_dev_driver_name(const struct devlink *devlink)
>+{
>+	struct device *dev = devlink->dev;
>+
>+	return dev ? dev->driver->name : devlink->driver_name;
>+}
>+EXPORT_SYMBOL_GPL(devlink_dev_driver_name);
>
>?
>

Good idea. Will add is in some form.

