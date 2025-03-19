Return-Path: <linux-doc+bounces-41299-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB47A68E9C
	for <lists+linux-doc@lfdr.de>; Wed, 19 Mar 2025 15:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F04827A2B4C
	for <lists+linux-doc@lfdr.de>; Wed, 19 Mar 2025 14:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22AA192B6D;
	Wed, 19 Mar 2025 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIi7XKWr"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B44157A6B;
	Wed, 19 Mar 2025 14:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742393576; cv=none; b=iHrwzs2nW1M8zCM0axo9uEeK9RbqHTEapbgDFNul4+PgM3tFFDNbGKXnaXwwkUqMy9i/0jfpU5m+LYJELFAtGJlcg/iwgU5/6gRQPL0OScOoa/B3mayTB/C3yQjbTYkCEzsactXGRdKoNMLKZxM0CnF4xfTObAW3xV6SMy1sBXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742393576; c=relaxed/simple;
	bh=7VJOMqWqh0wQcU1BFtXa6c0GzKjyuarAJOX4Wh2GmdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nIkXyeBBnWj/59N9S3gDHzSzPaPsyaex9N+rroWCPRcDwvr04ewPWmP7LvAFB9W3uaGwORUx6gLSbqtFtAsNWurvFGae0ZzwT9NSsOsYCC/BhbESlaV1xK5FxVcjeIkw3hsO/wdmHZ8JzAkNX8HmyDRJg9pipn/m5psEbf6OZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIi7XKWr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4305AC4CEE4;
	Wed, 19 Mar 2025 14:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742393575;
	bh=7VJOMqWqh0wQcU1BFtXa6c0GzKjyuarAJOX4Wh2GmdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WIi7XKWru5EjClACAxW7fG7MrDi1oafmrSYWuXdM4al6SJMerCD644yysnaDZp1p3
	 2LDcQEEXQMHEsUw1kWs1HQdpVEhZ+Rlh3cMQGDXUheT3jqRNpEf7RchuL1QIiE0VvV
	 9nXul06F0lg22xYOWnH40PRctJ5PLPcuTvKhGTABAzObaKo4uGJDbY90fglQchMrPz
	 zdnDS5wAHIzRd67LmF1G3JlvIXOdZYT6Fcj3yjWaUW/4/a8WWrduL730o5XA/58K0q
	 UVQaOk/8wXhRASzknHY8/8DPszhi4/o8XNYLNxMGVdTOL7jrB3VRz/2M5WGrtt7k7p
	 VKIjmLhc6/iag==
From: Maxime Ripard <mripard@kernel.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: Re: [PATCH] Documentation: vgaarbiter: Fix grammar
Date: Wed, 19 Mar 2025 15:12:50 +0100
Message-ID: <174239356754.697925.8716284607359471588.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318041249.20786-2-bagasdotme@gmail.com>
References: <20250318041249.20786-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 18 Mar 2025 11:12:50 +0700, Bagas Sanjaya wrote:
> Correct grammar issues:
> 
> - Fix "co-exist" subject-verb agreement
> - Correct plural form of "server" in context of more than one legacy
>   devices
> - Use passive mood for intro sentence of libpciaccess section
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

