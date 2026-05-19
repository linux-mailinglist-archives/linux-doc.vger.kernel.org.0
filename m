Return-Path: <linux-doc+bounces-88483-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBvHBqVvDGpKhgUAu9opvQ
	(envelope-from <linux-doc+bounces-88483-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 16:11:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8BE5804F7
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 16:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 843BC3028B67
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 14:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D167D3358B8;
	Tue, 19 May 2026 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="aC0r6vOr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66197371D10
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 14:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199415; cv=none; b=OY6sTivbfw10n1+u2UvevDe+9annyR65odpMEMXzlNcfrrNnXDnyPk+7YgL/4ZVAFkF0bajM9HAn2/hfaqw15ki1txUY+vyGLsxV0uFmN+ERrCUfTTlQ1rsoWudz3noXdNft7/6BYJSLaywbdrILhH9zrk4Xm8Lz0MKnMncWTBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199415; c=relaxed/simple;
	bh=+bd1mhLfELW8lCaWsXMgjWjAfAbJ9cWsuWqeqGjHvrU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LIxcOlcM++Q58pYq95Aydyo7K1XzY9u7RqOCE14UeAvuISjINQAaW/phhwD+/2kA3oqygpq4H8qcIwbPwcqGEb7c6MMToRBvmPgIVllYSaz/BUpLMfIM6wosz5R3hqfKUDL48iy2z7lfLC3UuUJBA1z0fBzxniPlCHNHuXD7J1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=aC0r6vOr; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-47c7b282d73so2423162b6e.3
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1779199413; x=1779804213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAmPSe9oMJmb2SDflrLo6XOZ/WBxHlp4jcSg2KpdbhQ=;
        b=aC0r6vOrndytiunxmxy+muv+HgKS2vfrAuSVO2p743r3+Af3mKWcRNsGQHbgEpNpqb
         7HoqYE5UT1l83jKC2jb4UdUOURH6//jKRTPqT8WBz57BMnpnKPViQYZ4sq6jDyPUt3yr
         4zfGcxHow6nrrGiK/ZONGtPu7caa9rly5MNSvesyPLncZtATDXQboGHvQlkSmvVlNWFE
         DLBBAEIUGkHgLd6AHiknPcHfgQQn27Va+E8dVMxZPL3+KA+oQVsXsAPG5jUw3AEOIASw
         0yYbbUuCT0Vkx3xwzr1nTX3Xv8SExGPSHfbs2egj4BmAg56Ky5z4rhiiBPdRf+eMmR0W
         rRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199413; x=1779804213;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YAmPSe9oMJmb2SDflrLo6XOZ/WBxHlp4jcSg2KpdbhQ=;
        b=ZMFW11Pw+8av0IManoSQN3MEFd0ArF5HysLhjS+J1yUG+IRL4rGu5iwc5b5SceRBTv
         FtMVe1oufmr0DIAi9V12KXipk5Zu+nQRIbqiT+v28uxfg3/aY4mBhiE5KKKSg+IpCDtm
         A+1yYOXADvN6EDWFQwAq0YR53VJMyaizpPq8gRrwvgdAi9ccwpd6e9epVjGYpm7To+HJ
         GQVgsgIHe3hpLODgZBPIPZ2NshyLiiGMMXw3t1/XYStZgXB1uFoaqfr4JvGjKcQ7QDdS
         RUIA+ko0hLKwoFomqTFvoZDHQVlHPMSHJS4QSzRc5xudxN97iUGVNz15t/oExt9/+sze
         Z6dg==
X-Forwarded-Encrypted: i=1; AFNElJ+aUTWA8MlpxpjG/OOhotdMgE83UlIZkG1vUnF8gWyGYVwxkDnuMtgRXbSlvfyC4DUzi5uO6iPU5CI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKm4IDo77+kCnT8bVWHdpxV8cDBUS2bJgogomb7xGVEQSHIa5s
	UC+uJGmlF2VUo5Q8sg5gWL02i/DGD0cHTPofgKfdWpQ/v5cXu1NbdBoXguu4FmDGfv0=
X-Gm-Gg: Acq92OGsfvDxE7XDSMxkI26d3fT0o4Lkoefmx+UyoHt8J/CQsziQ5jHKbNTs8Nj+SDS
	LStPE9hiLIf93PgrT9JT1zM1dMy65jl8Nc1bBHTdE+ENr2wyquSolrFBAzcj69Wu5Qy7oxwlpFt
	PAxSXCaFaz2BvKycT3FMsBxi1VhNf+HDHk1ZQDPcVsrFNPfUbgaqCvxBl6DWa/emC0Ilc97/bsh
	gFIC6LDOZZCVh79yztKmExGCBbUqwprGeuHN8z9eJyT+Nt/cB70s7vIDYsaqLtO+Cgdb/95hq8E
	eS/JA7QWDetwtr9FmhWfBE8klMT5lpP0da6id963x6QMY/k/4vbSNMTauHI9r6ROCvMHcjsILRC
	XgdqP5CkygAD6wNggrwKvjRcN/LY8wugXkksHeYAJ2WDCPYdAYOe/NGpQA6hx4QT26bOen2s6Ma
	5+QJaHxd1jm6GBhlXpZcZ2ObZMmTHmcE6DfvINOU9mLH+aahECp4uqdNLRTt2d
X-Received: by 2002:a05:6808:2f0e:b0:479:d605:64a0 with SMTP id 5614622812f47-482e54e90cfmr13118969b6e.0.1779199413144;
        Tue, 19 May 2026 07:03:33 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164581fdf9sm164071241cf.24.2026.05.19.07.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:03:32 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>, 
 Luca Boccassi <luca.boccassi@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Pratyush Yadav <pratyush@kernel.org>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
 linux-doc@vger.kernel.org
In-Reply-To: <20260519125714.2435640-1-pratyush@kernel.org>
References: <20260519125714.2435640-1-pratyush@kernel.org>
Subject: Re: [PATCH] liveupdate: document liveupdate=on
Message-Id: <177919941198.1116313.3518745939102714040.b4-ty@soleen.com>
Date: Tue, 19 May 2026 14:03:31 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[soleen.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[soleen.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lwn.net];
	TAGGED_FROM(0.00)[bounces-88483-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[soleen.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[soleen.com:email,soleen.com:mid,soleen.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6E8BE5804F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 19 May 2026 14:57:06 +0200, Pratyush Yadav wrote:
> While the liveupdate= parameter is documented in kernel-parameters.txt,
> it is not listed in LUO's user facing documentation. This can make it
> hard for users to figure out how to enable the subsystem, since enabling
> just the config isn't enough.
> 
> Note the need for the kernel parameter in LUO core documentation, which
> gets exported to Documentation/core-api/liveupdate.rst.
> 
> [...]

Applied, thanks!

[1/1] liveupdate: document liveupdate=on
      commit: d65d7e28888a6f3a1999908cacadd99f4c14ddd9

Best regards,
-- 
Pasha Tatashin <pasha.tatashin@soleen.com>


