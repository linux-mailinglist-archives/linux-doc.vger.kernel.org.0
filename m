Return-Path: <linux-doc+bounces-9451-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBCC85564B
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 23:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9499428AC4D
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 22:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D33C2574B;
	Wed, 14 Feb 2024 22:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VAWpfSDR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1F524B33
	for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 22:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707950768; cv=none; b=P2koQsQwN5LfhshJ+VUIA51Z0Aolyyltoq0opM4Izqnh3eHkOoGWosOlqf0Sr8XNdhFqCxpJP8w89FVVUUYUGRaJ3UkP/lN6estz13+MTQtEjdviVJiNL4Nw0P3xZd5qWFofglEL1yTQdBlulhNVyrJS98x7dCj8gmF4cSUTNic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707950768; c=relaxed/simple;
	bh=8bT3amGiS3fLKoyxXO7JZcJjrrEaDQwfviHZsFxAkb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSRfmShiAjLSWWJQQyJ5s6/xAYRy4mn9A+dmWqZyBmIrWa/NccalLEwvnddPjraTQp26J6f163thSVOfyo0AyUrPcfK1o/JZJsReALUUfxZFGD2wjDnse9ZsATVUJzZ225YQteGVgg/YhvpcdbDUenEwQl+45mIdmcVIyhNtIEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VAWpfSDR; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so293552a12.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 14:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707950765; x=1708555565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZP+BxUxePmCLWZ8ZfOeiaW4IXKd0KvZFg6WZ8fL0so=;
        b=VAWpfSDRfN4q7rvZU3wN2Mv4O4s0TQzoEaJsIKv1i3is3KnIdo4MxOLIfYqGouaZ9n
         wMTGPZ/vLpqnrpbuLemu3bcevOmWWF4hyIC6deoCOTQvvxuS8hfjrlFjeAneydjX8Z7P
         /RZaa+rzx5SlRizCRRllXzsFjEdMnhQjRKKGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707950765; x=1708555565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZP+BxUxePmCLWZ8ZfOeiaW4IXKd0KvZFg6WZ8fL0so=;
        b=l99yk2MNvANEfvrkagXIZ5aio535keCWDDzjAQ+V19BwSf6YtEPUjMD2SJDofVGV8m
         Mhcx4QVyh6w1hk688RqFubCVEldcrZWRESnvIfG3FrL1BxPcGOmPdwiwtaxhflPNsPEN
         e5SwNEhnpH32InD54ZviESgIegTkbJ/C45nTw6/fw+PhV8W1ieQEWJuWbaSe+uFuZA93
         LKgNemQ5uVoCeuaEyH2aH8j9DZu+KndQ547zSYrbE6IplzRZ2Qzr6gdJ3sYb/1jbCIKU
         x1iReAjRcJF1u8G11iFLet7ZMxU17UTE18mthUAcVapgG3+lFcGzlCjcdax2WLgDQ350
         hD1A==
X-Forwarded-Encrypted: i=1; AJvYcCWh/HULoo0/MtG+JQR1CPpEs4RpjJ4qrPYPjE+H6ct72zti63/h8NDTIzyj5e0H+Mt4/nuc5kGLW549FH3PXMlkmHhu9Y8Kwev5
X-Gm-Message-State: AOJu0Yya2NF0tSK4LubmhDXObTuIS+ajEbkqUTFkdQ3kfc+2A0xJh/CA
	de97r9RA8fwt5D7X/JCG6RC2CU8G7OgDOhMrdxjt1GuXdqCM1CYuQo+zK2rEbQ==
X-Google-Smtp-Source: AGHT+IEwKqfIdExn5GXKXrbxOA/cEMTv4gqm1KamsNHD/d7odYizVrN8PnY95/ALxTdDxMyMcTnEUg==
X-Received: by 2002:a05:6a20:c702:b0:19e:b9a8:bc7a with SMTP id hi2-20020a056a20c70200b0019eb9a8bc7amr256992pzb.60.1707950764884;
        Wed, 14 Feb 2024 14:46:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXUGkaK+uG2HYDYpAKvRgJiRcIWuMgkS/9TgsR66J3nWtHqH9sZHwNHgaLV+Aw5I+5Yho+5LbjqF8WB7N2Ph3FGaG04qfiX5QSW7kmtzs5fyp0+pnVsK2+EfOXM7A8h9CUEhYuH8ztUU6gvjoHDgG8ZFkOG4w4mxDvvkYX1zzkjjzbu2uil2DaCQkewklC5noE8NtF2a36TymKP6b36GAD19eg25KxsFC0voQhzwQqjoDGrzhYs5v334PjeVpU1+m9rcgmsVBQ8FDh+pxGBjGUUKCGQk2vpZjj9j1PfF/7wJziaIGF3PdcMWCbQXb9pzJ5XoIAH058/e8a9vWQu4MX9n9FdQokJvA7jfyf2ZI1mzQz8xM5JryGztpVJddSUITqxQjIWsZHEti2kDugz+Prl2/Awio4EURa09W9UG3QIzXZ+M48m/Dp7Pi9RlMRXQO4YvvyK+ZGSSYER2RPjfYSjPGeTewRJItDlUIyHhoQp19SCBj2U1/IN3KCSE37kzpZ5VrE3mAnTjD0Y/J72QxkuvPBskpwFXlC6w0RWQBGeeYUeZFukAt3A253vVftrPFmwd1ozzR+ElMzLA9NdZkSYEhGJ8Pc=
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j20-20020a056a00175400b006e04553a4c5sm9894509pfc.52.2024.02.14.14.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 14:46:04 -0800 (PST)
Date: Wed, 14 Feb 2024 14:46:03 -0800
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos Bilbao <carlos.bilbao@amd.com>,
	Avadhut Naik <avadhut.naik@amd.com>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, tech-board-discuss@lists.linux.dev,
	workflows@vger.kernel.org
Subject: Re: [PATCH] Documentation: update mailing list addresses
Message-ID: <202402141445.F9E9116E9@keescook>
References: <20240214-lf-org-list-migration-v1-1-ef1eab4b1543@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214-lf-org-list-migration-v1-1-ef1eab4b1543@linuxfoundation.org>

On Wed, Feb 14, 2024 at 03:09:53PM -0500, Konstantin Ryabitsev wrote:
> The mailman2 server running on lists.linuxfoundation.org will be shut
> down in very imminent future. Update all instances of obsolete list
> addresses throughout the tree with their new destinations.
> 
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

Thanks for this! I had just updated the TAB's internal docs for the list
changes too.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

