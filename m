Return-Path: <linux-doc+bounces-81350-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPSyDvpJxWkU8wQAu9opvQ
	(envelope-from <linux-doc+bounces-81350-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 16:00:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E8B337333
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 16:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B0DF30D4812
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 14:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786603F8804;
	Thu, 26 Mar 2026 14:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAuQoxam"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B52F37CD41
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 14:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536802; cv=none; b=AyUAfv1tsog/e3Qs5A5Mo6doqBFKOkA7Ej21k/+X7VENhJ1aE9u0zrF+kytQF6CCcbuL1NPVHxJkZn4DCdo5NeFfBTrsX+mIUl5bYxGiShdwQgKOFc2kqOJWN0YqQ/FywlV+uf7HcD02vG2ZfXQT5kmbgglkZwu2TDBfD79NY5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536802; c=relaxed/simple;
	bh=2388utc9394UFJS/UPxBTvHU8BTZ6fiNdrXOl7m7DM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQB0PjOFKCHJMNj9NdqJir0eAUx1efCnHRQnW6xW+r+Db7m9AklMrHp58K372/ZYmMZKo1IuKDtlBmH9DgLT1R7WI/WvNa6OKbeHTOs2xcd0xgEcMfMpHNC/tDZ9cnC4sCp6WOB56TEiQv/m6yXi6UwEA/ZvpKN28ZGCKkaYNuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAuQoxam; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-128b9b7e3edso99094c88.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774536800; x=1775141600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=73CDRh4oXvGZ73Mm/YRLMvHfAk4P55rJanZOEN5QMuU=;
        b=hAuQoxamFzwL3heHjqiZdcDHYXI7ggaUCenY6xjUEmHFeYnDOn8hplwr63FRVmMY35
         EBE9loZJkqe7yqJV3oCFCqkSGCJuvvfZgmvpqW2FYI9nItxwQXeOhttqx0Ghz8hpxZrZ
         v1QM2RNXL3n1ShHHJYu153TR+rnbC+cOGA+JDsbX5VYgZGPaP7FUZ9wFUZoe58PVLGVL
         yiS9EoeI9oPqATnNjFZyrfAwyNVPr1vSjMGsLXZIrX4iXKIMLFkBLnLedIKXEQXqYFrM
         l+2DOlNT1GySAtEgwRm+GCW5NH3wgiJ47jIA58CaIvcIq8CBfxhTd8M0pi4ERW5zC1IG
         zyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774536800; x=1775141600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73CDRh4oXvGZ73Mm/YRLMvHfAk4P55rJanZOEN5QMuU=;
        b=gX+cLUK8qbZOI69q6uDiksXcukkHHB2QucwssUjNaEi+HjwJzkff38Tq5rYPpuegnb
         JwkVAwoHNZBeErFxpP/4MLlYWG9u7MpQfokzY2stNFzylSQ+UgiTIgjes4ebpKF+vYzR
         J8kWvzsucklndMQFcFbzTxPWyQH4jmCYsY053XkTRr2HmiWOWje2k5QrbUBs/28HstsJ
         3QafTnOF1r+m/HluG/Ww53mubAWfUG9LcFqby7PvCfI+Y1Vo36J74W5cKjklBEvBOBV8
         aY+bGI3c+AOwShG+GIHO305sD50Y3naRggfvRvnK7dA37wIl4rhC+HjBxzqJiv0RGAS8
         9aog==
X-Forwarded-Encrypted: i=1; AJvYcCVPHVFyfhga/d66r3X3OgNE4+qCYY5RYP7/ZWLDnlYUEqAYiVSrDa23R1k0eMQi94Mt654z6epdnmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZRVblXVCyilKW0JtOLvseubV0LkW6nISZ7q0yc6HcxXflCuXs
	h7yqEZdsBa3o80Bzwgqh1qKbSJEmL711yhOW0QjkbES0nxJ2yKho6QvR
X-Gm-Gg: ATEYQzz34lz0A3R3LM0Upv/Fi2x/m4SNq1XJgGf8pFHF9DnrXLoZn8dulnvGPqZmNJB
	D7betoc0r5OSYWujZLkYATIjTBgTnPbYGFfGPdCnjs1kix8gw2trWu/gcqDA3M8hvOjGBTrbBNi
	rdcL1E8ms29letOCOwnmOIH5F4MmuikJEwV92xxehkPeapq4pVaHXRWJCSmGBiSt8hH26e/JaYx
	+QJWrsYDsdPO/FNpzewzBuqUHOpesBOxq2iRPfO1fN0dX+RTEAgPXMhflBT51WIbmG9E0hyRy0c
	fHVnQXSePEdvAaJtbE91YvMAXQGxpgDpKf3971Kicbjqlp1jTGCqgkKxbcZbnNUIHifMSGW3XJM
	jklto8pMoA5jdrXxZ6zLalem/hX1Qb26WwFDJs/bZyfIaSuRovY3IhOr1oC/gKM46c9l/ofYmG0
	VcY+tAqu0i/FL47sHNJvA8EzTbmV9IquO1E0rzbqqQKZL2kgEsh6sg7vlnNDYsohAN
X-Received: by 2002:a05:7022:e17:b0:12a:7181:2f1c with SMTP id a92af1059eb24-12a96e6b019mr3622063c88.17.1774536800232;
        Thu, 26 Mar 2026 07:53:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7b4:352d:eb23:66e5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa7248731sm3357533c88.4.2026.03.26.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:53:19 -0700 (PDT)
Date: Thu, 26 Mar 2026 07:53:16 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
Message-ID: <acVIBseRrqJI8Uwb@google.com>
References: <acTPXMJfkHLeItrK@google.com>
 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,canonical.com,lwn.net,linuxfoundation.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-81350-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: C6E8B337333
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 01:46:49AM -0700, Joe Perches wrote:
> On Wed, 2026-03-25 at 23:20 -0700, Dmitry Torokhov wrote:
> > checkpatch does not handle full files well when they are passed on
> > stdin, because it does not know how to treat the text, and whether it is
> > a C file, or a DTS file, or something else, and so it assumes that when
> > it works with stdin it should be a unified diff. For full files it
> > expects to have a file name as an argument and read the contents from
> > disk. Unfortunately this does not well when trying to use checkpatch as
> > an online linter and feed it contents of an editor buffer that have not
> > made it to the disk yet.
> 
> Why is this useful?
> Why not save the buffer and then feed the file?

Because when I am editing a file I am not saving it all that often. I
want to have buffer diagnostic updated when I leave insert mode in vim.

Thanks.

-- 
Dmitry

