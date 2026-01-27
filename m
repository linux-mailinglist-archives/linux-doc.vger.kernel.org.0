Return-Path: <linux-doc+bounces-74123-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBYjIzfYeGmftgEAu9opvQ
	(envelope-from <linux-doc+bounces-74123-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 16:22:31 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B38E96963
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 16:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1B853008E1B
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 15:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BA1363C5E;
	Tue, 27 Jan 2026 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3yan2P/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E443235E54F
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526730; cv=none; b=cg8oXu1lHqoYPVeHGZE/RBCDgv40Dc8lZGnlWnGy5oU7B5fxme/AtfPIJObwQh+uCcGre7NoKgFqWIwv70+qi4AvuP2Ku+NcLGivDmF5dqXLdw51AXj1knlP6MTka7ehJ9ul5QTArVhT8BG6UsccCxGMD+0J72RmdjqCvniBd1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526730; c=relaxed/simple;
	bh=Q0cKqs0Dz1obaEFFVDj8DAU+DC9JZA7AYb0lIuSwGY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=um7R/NulJDrk9JpLyO3Uxq5AVB+z9dzSrpqc53N7JTslmy/xbxEMUFAIfD6lSB5QhrDUy+k7XMkXjEOfH6xw0AkXTdwyMFNIhnPDgtMqGf8/cIcdAT4lQd2OFCtl06rNjpQFuBMV6bBbxFZhNV2XeF6BWH3bNbcFzKrm2IKgEtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3yan2P/; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b7381d2d95so2428524eec.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 07:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769526728; x=1770131528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9zCVx2BWe5mnavK+mjSCOB1GzARJ9mP4Z2n+82aaf4=;
        b=W3yan2P/gMAHlxzzJLW1KiccBJLSrALkYwyCrvnOFksDW++Pml8uHBhmsOYTDBqIlg
         ybA6xAAGcMMBjBD/44BcvulDyLprj2R3CpjyQXq9DjWmPRDOPCGT7hu5z0UnAP44XlMe
         imhETc9gUtnWVpURzfPpTikLvXQLIB4a1jxW/u7AQ73SGw8NKa57YCmkl+Y3ywjBoh18
         BwOdofgXOWHvAiHvpzNBeOI3xlioZgq8FsM9ESwCDEry7Ze87N4cMilffkIb2UH9E1Kt
         WLK4PHb5v1vrwt1VKBmpvOcMScuPyykhIc8GgZGLYXxOwBBeGnWFGmJACxnBsoGNF+6r
         YY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526728; x=1770131528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9zCVx2BWe5mnavK+mjSCOB1GzARJ9mP4Z2n+82aaf4=;
        b=wY5i9HuBBzA+37pBhn3VynBBo5F7SzUvpOuVufVIs37Ic64NqnPyDt6hm6QR8sfuNi
         9nGiRWC2JzQgz7ZwH/6l4LQig4cTsZ09Eu5JbKn3iQ/++nn7/0A+u3Dv3wKBBNXH8mZZ
         ZYZHuPGezsI94o50WZRHrIBZZNRfjXne/rQut71my6WzX9McCJI1UkchYZY6//6aZF5T
         /CBo7XyN+G1TDhzvBo+lvYK+oW9utdA9x3nMlDALe7np2HI4IOg1aXo8wwXmXX11sHIk
         OyxPntamydJs5xFOH6FDsi8qLZV58dZAPl55VUApc58VqxY7QjPcHwW8PFEjh52CebQD
         HtPw==
X-Forwarded-Encrypted: i=1; AJvYcCUHguKxAEa3k2xyqHBZmLcLEF9lFl2dAnewqXeSbxNF+hi8DsVEuPdL5xNWE2SI4Vg/bc5PMBnLQpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4dPLMRXn/ioR49SlLTiKbW1foNuVunMUNezpfs5ZNPaOYJ8GK
	3i0uxPnvxYVGlphJzNzorzymMBpG96i+0+nsEdCbMl8xA730tOUQe34R
X-Gm-Gg: AZuq6aJ3VYTMRzeodU/BTv2ZaUf+EwfSjT8JrXJxzvGphtkuk6IMVBhXs65LnZaWfp9
	J4wLTf5xxHOZfneowEZPsgadDy6XA8kUUXEqhV5E8bEtoZOQr/KSAdGYzjdEn+NERsJ0n+3qz3C
	UPoKH2NZ/W3JoEPFm5atTjZ8VnR0yZLfF0wBLlwajYf3Msyze3c2RfZz0E49I7Dpxkb3qc21VfG
	k8WhcuaUWcOX3rdoeEAbj5cU0Q/jR33oZAJwED8Qwgv3fKBs0T0UNBrBjHLGVgGhgoZM2FqNGGL
	ZuAtw2Gtmwr0wkQFzFeY7adklbtjqZDgoSo2XgXzGb5bFUtyZd3bLSgmoo4blO8rsl04Junn8K/
	Aa05SJol6PuQmVizhmz8CdSsWnLu4N2wEBQ6ggBCaKRkGJgJYxK5bcodJW32Z1Rbr7I1nH8yRgq
	7Nd1BNJTbfptrn+TjbOQp3dKxH
X-Received: by 2002:a05:7300:72cb:b0:2b6:f13c:8d58 with SMTP id 5a478bee46e88-2b78e977fadmr1460659eec.20.1769526727776;
        Tue, 27 Jan 2026 07:12:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7987cc01csm493102eec.35.2026.01.27.07.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:12:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 27 Jan 2026 07:12:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Vasileios Amoiridis <vassilisamir@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: Add hitron,hac300s
Message-ID: <b4c150ce-1570-4b12-82e7-62b699adb377@roeck-us.net>
References: <20260119190806.35276-1-vassilisamir@gmail.com>
 <20260119190806.35276-2-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119190806.35276-2-vassilisamir@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-74123-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,roeck-us.net:mid,cern.ch:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B38E96963
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 08:08:05PM +0100, Vasileios Amoiridis wrote:
> From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> 
> Add HiTRON HAC300S PSU to trivial devices since it is simple PMBUS
> capable device.
> 
> Since this is the first supported device from this vendor, document its
> name to the vendor-prefixes.yaml file as well.
> 
> Signed-off-by: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

