Return-Path: <linux-doc+bounces-827-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 244BC7D3917
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 16:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4823D1C208CE
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 14:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7D818E3E;
	Mon, 23 Oct 2023 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJnG6Atm"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD3311CB7
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 14:17:09 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66301B3;
	Mon, 23 Oct 2023 07:17:08 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9c603e2354fso700753266b.1;
        Mon, 23 Oct 2023 07:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698070627; x=1698675427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psYa+jnhYhA/Me9tMdYWGK89iV6ZDBFIZP/pQeD1uzc=;
        b=lJnG6Atm0YVpq16+S9zOHOCEaFMObn8xk+Moj1iug2ek5HRv2Z6GouIhXHMXBEB0qW
         CmkeV9UsI+R5ZA5ZzO1rypA/b0B7q1DCV0+2xrWICxJP9VlN62WIAkioOy3Fxg3uI74D
         /mA1jBhvEEzX6fHnji2ygfUXXB3sTqRv6l6SKSnJfojAqh7g13wsd9zNNUSx6lAEH87y
         VQEmiaQ4vx8MH3PA1zCrRP8s3O44TKBCLDVKt9nhvvFYBX1ItgLGDx8P4lVaYsmbHy8P
         4dDk8LpRWVIVpZkQ+EljyPlKdYrCZ2iMkCAphvzkzqaF9XnEubEXmamfqpO2jZb36flY
         N8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698070627; x=1698675427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psYa+jnhYhA/Me9tMdYWGK89iV6ZDBFIZP/pQeD1uzc=;
        b=Y3ioYhPlCuMTysT7A8o4A3Z451cn4ByXcYSa6S1V4RFEsRPGZ6Bg5edOxZGqkZd1ki
         Mcl7L7tgXJ6ZExyqI2vzJqafFMPenwle71k1F8fBiLienEsiFP+QsqsLARNZ8MNITeNy
         IEcAF0wr8gcW2XClAgVUzwhYexwj5xekJfYyhVA7GxPokK+v3fDUSecRqNF/0Ytlf5oD
         JTj52PxOG7RqICUVP5ZHsoA1ABXqFc2tMTAjdRFspesLNRb14lPiGYxwyHFP3wC+CXlq
         KhTuaDYViwI9l34nv8IrCLwE08exdaVWEIRvy9CtjqVLvzNkxzRKgqRQFu7V4+K68ppo
         l3sg==
X-Gm-Message-State: AOJu0YwMOxoDK8vzr69N4QcSvzgFv9FklJBYFTHdyCxkdB0vGoISShoo
	rR6hGGa8/RNIbtB/j+pmgufNUgfzrXbiL9um4bE=
X-Google-Smtp-Source: AGHT+IFVR84iaxW5JTSSwCylYDnHrJuy/QOC9TeTDd/7izvh1HJa8XLVoWYXfvL0h/RAiLVXysMlSryrZfXrwsAoTtg=
X-Received: by 2002:a17:907:9727:b0:9ae:5513:e475 with SMTP id
 jg39-20020a170907972700b009ae5513e475mr9252000ejc.9.1698070626608; Mon, 23
 Oct 2023 07:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231023102846.14830-1-przemyslaw.kitszel@intel.com>
In-Reply-To: <20231023102846.14830-1-przemyslaw.kitszel@intel.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 23 Oct 2023 16:16:55 +0200
Message-ID: <CAKXUXMyOk+06ZRc7gvYMA=KHvZZp1FXiCJC5Tp9M=SUQfQnBVQ@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: allow tags between co-developed-by and their sign-off
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Sean Christopherson <seanjc@google.com>, workflows@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Jacob Keller <jacob.e.keller@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Przemek,

On Mon, Oct 23, 2023 at 12:29=E2=80=AFPM Przemek Kitszel
<przemyslaw.kitszel@intel.com> wrote:
>
> Allow additional tags between Co-developed-by: and Signed-off-by:.
>
> Removing the "immediately" word from the doc is a great summary of the
> change - there is no need for the two tags to be glued together, barring
> ease of checkpatch implementation.
>

I think the currently suggested process of keeping Co-developed-by and
Signed-off-by glued together is good, and I see no reason why this
should be changed, nor do I see any drawbacks.


> Additional tags between Co-developed-by and corresponding Signed-off-by
> could include Reviewed-by tags collected by Submitter, which is also
> a Co-developer, but should sign-off at the very end of tags provided by
> the Submitter.
>

The other tags, Reviewed-by, etc., can go anywhere just not between
Co-developed-by and corresponding Signed-off-by. So, why do you have
this need to put it exactly there rather than putting it anywhere
else?

The commit message tells me what you are proposing, but there is no
rationale in the commit message and that is put up for discussion here
with the proposed change.

I see many potential areas of work for the checkpatch script, but in
my humble opinion, this really is not one of the rules that needs to
be improved.

Lukas

(...snipped the rest...)

