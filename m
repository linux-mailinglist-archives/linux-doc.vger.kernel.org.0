Return-Path: <linux-doc+bounces-83053-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIExBxQl2WmnmggAu9opvQ
	(envelope-from <linux-doc+bounces-83053-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 18:28:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBC43DA646
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 18:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A27C03084881
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 16:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFCE3DB65F;
	Fri, 10 Apr 2026 16:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIcQ5zy4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40FA3DA7E9
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838144; cv=none; b=DClAtRfVUSPrxbag6++pB+ojAXMBWh4nBQ5DbvT4+evh0Hobr74hRDzM2ELopaRxU0kj45ClJbQX7povfXFHUVuyMfDcBgNpzIMV2C1Iulyd4R30aHgDrmT3FlgXLPerLkp3R9i4/kJpYCS/62mIvMPM5t1m7Z4bOrtRCVrsiSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838144; c=relaxed/simple;
	bh=BBIkEk5IWn0dgN8UubTAKBIOMBYqreRBUyJgp0WUWdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HD9sA8I5rGQFy4ySPmzzRccLkK/0GyKaUQxVBy5BuHgjw7FGhWQlC42nCIOwz/OBp6f48ZvutM0eQyfBhFJmNaMkey1+gZt+W24iTnXZ0i0ElrVdo+NEWuflQ5JNzXcDQwzzqtuYQXAVRggVbyfN2j182dUL1P8QiWYsBWRd+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIcQ5zy4; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-128b9b7e3edso403287c88.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 09:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775838143; x=1776442943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ud2WfQQv0Jjbl2amZn8W+6KYSKXPpeMW+BFIbEVApCI=;
        b=KIcQ5zy4WnnWRfT+vruB+DhxD+8sbKr00/OiqrrZGReIyT4YTyfsLmVjwLgFWTNVHN
         dnjIZhfj4MTQB2UsLYUWwhdwWmxaTFduiUdrjw8tXkECHSFJ+dDpSCvxMtNUYYqixcnZ
         PN2mi9JvYnFFy2NYz3i+ZBnGAsieDtoaQxWh1muDdgGIipaX+i5+mZxcP5ZI0JOlNMSf
         ABcQpxq7CmdvxAGbabLHqRcp8O8XWIIxkszwI24UX1jJYi1GSJMp1BzVDpdEMNdka5qJ
         WN37W5cGxZRsCaPm5lU8gnebn17uZ/UzfJknmwvTB0XzA1V9PKn+IG04ApUnYXpMU7Of
         9f6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775838143; x=1776442943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ud2WfQQv0Jjbl2amZn8W+6KYSKXPpeMW+BFIbEVApCI=;
        b=foQSJVf8mowl4CNAfeQ1apCfju0RbRLiGlvThOZXffkJy6Xb/JK3YDxyYsrBJ3fZ6V
         6lLoVQVITiwxnBcsN/TNoEbs8yVeCePCduNtHVBvwAFS71v6gLYa+IO20FQohUC1Wnxj
         0/nZPf09hDt7Q02uMql2d1zxnElPDn0hBYebtBVP+Tx1Jm517kGHwRCKPqloo6igW80C
         jjYMMI8hE4do7y2SiM5T+Q1pFd0SDqvMJtTYw5wmkKkqqFPiPILZ65e1unQsKphBczQ/
         kNcIC8QTTQwl6pEVj/mRCBhmJyAlP2RJRgC80CZwlxRdl/7GB9sxiseHyIzpexVswon9
         Ecxw==
X-Forwarded-Encrypted: i=1; AJvYcCVVqmkD+VFw1ZjmPnsmVOi/XaVWrSYVWVNnrmV5mlvxp4XbhPHmN896/CFNYEXrRo1zXa8kJe/G1z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaO1uSHwbT2ZQNuk2AFiy/tIkW3MuKPD/BVItuus6LUz7SZ+mu
	F+aLE5KdSuKTYKeq++4QgwnKmZZPM10W1EDQ6ELINXwDI0gilRvfTrIl
X-Gm-Gg: AeBDietZtP7Tz3y2IrjrKeLAZYrjJ8Ve27X8F9vNwKm3+N2U7B/rxXoNPK1flf6wv7M
	AxGcDNsYfG9fH1hVeH7oznJjquaVtJpZAEVNw000oCcQmKN/PthJNlG1hEVF32DIChYc6uZ7Bab
	QzfQ/Qjw1+jXMPulF1jZTRLAYfSTI26DcPFcm01GWB4mo/YwV8daum6MJ/yMoZpJt7mG+83zjox
	yszoNaY7oEH3JQylSNB6axQeERzgseQHZpIjOocHj0e/I8YOJfEjt9xtm3KG21AhnoHXBtJyxMx
	FZjOJU4aK6qrz+dUVVH2WQ9gXXYXp9USbBDBFssIsrZrAWXNf9yc1OEGJpNR1OvzMsgNptp0zUM
	Vw229BwbP9Odr7yA0xmaS0eIkZdYbQxwkzDYMLtY1PoOz8hnhOO+50I3ZaueoC+g+xeaYJYIe76
	YXupqg4HHbQsRrbQ3i8j6C2rZBeucoqj/u22NjGE0aM32vX+g=
X-Received: by 2002:a05:7022:60a7:b0:12c:33dd:f9ff with SMTP id a92af1059eb24-12c34ef7bbbmr2055222c88.33.1775838142675;
        Fri, 10 Apr 2026 09:22:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb228sm4445290c88.9.2026.04.10.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 09:22:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 09:22:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Victor Duicu <victor.duicu@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, marius.cristea@microchip.com
Subject: Re: [PATCH v12 2/2] hwmon: add support for MCP998X
Message-ID: <3025e1bc-9801-4483-b03c-f638767c1465@roeck-us.net>
References: <20260403-add-mcp9982-hwmon-v12-0-b3bfb26ff136@microchip.com>
 <20260403-add-mcp9982-hwmon-v12-2-b3bfb26ff136@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-add-mcp9982-hwmon-v12-2-b3bfb26ff136@microchip.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-83053-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BBC43DA646
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 04:32:17PM +0300, Victor Duicu wrote:
> Add driver for Microchip MCP998X/33 and MCP998XD/33D
> Multichannel Automotive Temperature Monitor Family.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>

Applied.

Thanks,
Guenter

