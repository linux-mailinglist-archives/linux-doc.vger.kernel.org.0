Return-Path: <linux-doc+bounces-85331-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AJbHtuO82kh5AEAu9opvQ
	(envelope-from <linux-doc+bounces-85331-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 19:18:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A334A6446
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 19:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1E3F3008881
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 17:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E187A472764;
	Thu, 30 Apr 2026 17:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0a0ytkw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12B1406297
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569496; cv=none; b=BtYPRa5nOqWHSJxf/HxoHuOVKdfVXlkjV/fUifrvZqnUGjznKY76ss0Yw5yJl1VJ/ADq7yaC2M4KUZRM5Bt2TiXbvyrJ65ITdXKecy14VyXXeh72NcxqRv3jhdlIZysN2hIW+Uf+ULVZC8xXk7uQB5mgaFhFoycqIMVw2eXqNeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569496; c=relaxed/simple;
	bh=TpyWBTtCvl89I2VI/PwXM64XWcoldK1gMhZ8XyRoh1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCSvsX6Qc2TPY5rhXiOKtY4oKtOn+YLIwBOrLE1iBHZ+yLcYh4GRzuQqCIBBAkDEgDDEICEYXCmn1xB1p/hx2kyAmN+6TQFJFlsBkrzHiXUNDgH0YOtNk/fVZQmQRAGKSHnLj4BQt9rrimTjiV8FM0OCgFIXk8LVdn83pq4thao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q0a0ytkw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso7799705ad.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777569495; x=1778174295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ALENd3xMV3SWWFyPseCQ4MW0PKHdxiw3vbFxIMfyRI=;
        b=q0a0ytkwvlBodDBAaRMQyIwLGoAapp6RJ3H4Z4nYhytUygJ1UbUN96oGBXWeN3QEDF
         S8wAHu6xoAwmy8Uy0U/H83eJW79WC4NnjgPypuEV8cpfzrKoyCSgfKHAF4ucrHx0YC3Q
         pv7Roi7KDfoKATrN28d/YZafXpTQ285v6/GX2QRwme2CWxe5ek8AqQ92rTgovAKxllXA
         u0Pn9uOFLVij/21oe43hUF3BMCQI8ryOqx+5o4b83Qx7ctYvdr05VRtzlv4BZfJYCyAt
         agPIqeZHDmxg6uirmusAAd71ocz3IJ2gd2MWAP6om7tDW8n4pV23bKfiIcEDz8xNpMN7
         C7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777569495; x=1778174295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3ALENd3xMV3SWWFyPseCQ4MW0PKHdxiw3vbFxIMfyRI=;
        b=gHnFqd4Uw+ugTwU18dFfHoWOlSIiMemACb2s9+D+qDoCXqvnufwE7yzDFJHSsshuDL
         nVo+XFKZbAuKFfh4DuZIbsoHzQfJ+C23/M5CcQ2O4g4v5LmPJnsi8c9c5O3403lDEhmI
         Rmoh+i0dNtTO7u/umblJkkGfjJFrSyF/ZqNN0KtKChdyEDpqm7/STyIZtD7FgiX7owcy
         ZT1GNriTgwcJvpYPmTS6XDKD8gL1fI9Ycyy8KstM/XtPNR+2HhgHcJg/3BSC5WSycy/f
         HkIDmeG+xfArkMBVC/i4sAiyMFjDXafFMASzgaqEq1V6ZeNvrqdE211J3aGn0zUmPX0l
         K86Q==
X-Forwarded-Encrypted: i=1; AFNElJ8dVDRWTXS4cDm3dXR4R62Ya0waBjCiHX6+azXyOmsk6BE0zLml+HLGovWjZXkvFzYEjegYQ0f/CPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywou4HxrHypW5pqHr5WGuc12K5Oxk1XW8XpkY41OopymtRAD0la
	oB5YzYDi+SVvhuvUUhEa4l2LbPFw24tq0CO4OYfmc6xnkfmo+Iax8WkY
X-Gm-Gg: AeBDiet7w59gKLGesjiMQJm5yrkJqmrlXeLjac3ww8oCgVaF09zhchSofmH2bT7Ejb0
	u0Z2fgFRhXAF+ukK2tKkiBTuiw0qowpA6cMa7JhMGcM212NJap52SDMIOlBlAz/GPzqu1s36YzT
	MjU3FaSxlG1I4Vy8Qh3wlMt+kvNwv+JxMpXHqYvGHq/srjCqsilA1hOq1CEDqBsQhC7XOgxee2H
	+a5BnAxWaebYh773X9GfC+7Maa7a8LsC+MPMbXm14YnAGTM3Ctk5/4nP3/fdkCjAWdHth2QFpYR
	o61264C14+OX9QWuc0DmwtCYtDDgY2Sfgu+Zo9AB8yyu1DLSneVjWaJFyLz4LsKWyVxo8e0nGer
	uqMzxLOEc3P2bdm8A+OMtpic5l/aM1zWGxuOzG/DEPJF7S8oVmDTiY4HU7ufS0A9xtZWvuLk66V
	4BfH23SUOs258PKRzphvkC48XRAP9eQBcYb20NkS4aKyRalKE=
X-Received: by 2002:a17:902:9a43:b0:2a9:e8b:5326 with SMTP id d9443c01a7336-2b9a24bee86mr28418795ad.23.1777569494783;
        Thu, 30 Apr 2026 10:18:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caad28c1sm1886155ad.34.2026.04.30.10.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:18:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:18:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: add MP2985 driver
Message-ID: <cbc39633-65a4-4313-8035-56d040def5b2@roeck-us.net>
References: <20260414092801.1067470-1-wenswang@yeah.net>
 <20260414092921.1067735-1-wenswang@yeah.net>
 <20260414092921.1067735-2-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414092921.1067735-2-wenswang@yeah.net>
X-Rspamd-Queue-Id: F0A334A6446
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85331-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[yeah.net];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,yeah.net:email]

On Tue, Apr 14, 2026 at 05:29:21PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2985 controller. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied.

Thanks,
Guenter

