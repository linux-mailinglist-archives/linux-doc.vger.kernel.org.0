Return-Path: <linux-doc+bounces-46950-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E82CABE5DD
	for <lists+linux-doc@lfdr.de>; Tue, 20 May 2025 23:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3240D1BC2C7C
	for <lists+linux-doc@lfdr.de>; Tue, 20 May 2025 21:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A1B25D55D;
	Tue, 20 May 2025 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="SATGsQUV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7061E9B19
	for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 21:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775764; cv=none; b=KNKMOCmtZgzpSujTyhMAYEHXsUPo9QFiIhJnicpIFg3VGG1spUHCxQZOiUtYkrDu26R87xlkycCltkcJy89XzxUPQ8Z8cVkndAixDxRaEYK3aUV+I8ruFoSd2bvNrdiaBriQ0TZ2r4rzYtgkAI/inI3q5t3iLAiOcy8vVTXzia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775764; c=relaxed/simple;
	bh=PokIbil+4vzb3IM+d56Xpj4Mvgib+ySxP9q4ulJxR48=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=Xr9cqhUN3lpjBT0gJYpCzPsoJVVmXLa8CAAlr9yt22XUFsoJn8hk/NhNxJQ5rrkMz4Uh97+kevUQ6or6zoE8MH6XKQ49RHxAnvE9gbF8Ys1BTgGIV0eTJeplUrcXIZ9c/ChPOdV3dl0uajtiijf7tf4oM8NAQby0IdUTlVhFDT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=SATGsQUV; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f8cad66696so35443916d6.2
        for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 14:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747775760; x=1748380560; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Vcim2IrvThidRodNsg/OfOdq2fd5gLucgy52LkkAJU=;
        b=SATGsQUVNCcWA5EQ2sN31YQi0KcO0OMgg67xcYs16ITaMOe6Op0u1D+gq7ILTSB/DL
         FQdpiltkvmAEgWIanzWiNeydwbuD0aYpWwjtKgHSWO2+a1IMCM/L2d/EDsMDVqiR/t2A
         Dr4vo7CV/Fw3dsrFiU//gjBLuMSUaBhq8lVdNQAtdZY1PTDlbLXocFdQ0S6bxFniWug3
         JssnaOmXDTxnsZ7//pEfNyN7VOKN1Tmeke8pl+mCHHEZ5Qa9IcHIRRtY9bPIi/qbv8Zm
         XyXzgURy4XykbyrKYNDGCVpAz3iq+XNE3u0910/h/s0G2OWeoqOMatHPvm/cFMZvW8ps
         LJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747775760; x=1748380560;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0Vcim2IrvThidRodNsg/OfOdq2fd5gLucgy52LkkAJU=;
        b=O6Xh5Jj4/KTWcUihR4wMbTSWG4DufJ2CtF0hBcwcy0LnGEJUR8iu2L0L39jbR9eN/z
         f6mFXM/2soSmYjvQzHSsqLXByJCZEaqgIixa/S6a3I5Yl6qLuiyCaAOk7KtwscH+Zj86
         OhO9zNgPD4Z+m+QI6wx5q0V6Dw2q8oaeF/KP3dpuKO6mmRrpn0BXI+OZJjFGu22DGWOa
         E4sfICP6SZ1tnV8HjqMqO2+w1lKG8T3a9hZi+dhMurXkhEUPsLtVfA0/hgQgI0EZDYKv
         9A8wlXzYIY81ZdONUdVSVVNufe2k4hebuHiT9p4M/4OCTBD51RVlArcLTXpkgtueBMEt
         Tuuw==
X-Forwarded-Encrypted: i=1; AJvYcCU7oWDy11T454i8rH5bgCIQin0yJDrmVP1ccZq5Wl/l31pCRLo09ZRYvj4mW9C0YJyUA+aBo6DcRiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvOTRvPirLg3zf0UVd1eLAA5cm/fVaQhgx6fhUd8qM2GfCXX2i
	AdhyegY+i/upFupkQ3piZUVGsH8aUCyuAaX0ADa7y1yKCaLnODiEucKNhvW1Uap1Sg==
X-Gm-Gg: ASbGncs7xo0S6jqcpZyvWuVXKbQpvYdjdLILfl/MBs3ErkYhdYe6y+t4pEZTCOREVa1
	8itxIW7XZ/SrnEcgANPFKr81Y9k+ZSaTTvLbSwAv1hZ1QYkk95rBElydxgbWD3jdz6M5MepQFX+
	nbZEo26MywXeumjPII5j2lvOKHCBMObADaQgMYa0tBFGTwoMJtxWxitK3OPJTPNhdacyrIHB2u2
	5gnGFNDaOqLuAZv4xolAU6PbZexUTZz9sHViPFTE5Ga1qY/3CU86tiiFPdp5pzJRflfpUaq8/JJ
	BckSaw2CmveAtrdnPpIJhqf8ztZYzg/kYp5HiRBw3jpoU2icoYPsX4wUhb7nXtWHFfJkPnJPH36
	SZ0vf/HgdWfBmLGzE0E/H4klA1MimxOA=
X-Google-Smtp-Source: AGHT+IGXRcWfO4AHv0ErYu9MQe8pxWB5OkTwD4jggVmmRyicMFT0cpUlaxE7iaZV/7atuSeHLh1gYg==
X-Received: by 2002:ad4:5e8f:0:b0:6d8:a8e1:b57b with SMTP id 6a1803df08f44-6f8b0873ba6mr330435226d6.36.1747775760552;
        Tue, 20 May 2025 14:16:00 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f8b0883b93sm76456226d6.14.2025.05.20.14.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:15:59 -0700 (PDT)
Date: Tue, 20 May 2025 17:15:59 -0400
Message-ID: <eb68761b5a2d53702f4d6b80fe2a6457@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250520_1533/pstg-lib:20250520_1521/pstg-pwork:20250520_1533
From: Paul Moore <paul@paul-moore.com>
To: Li Li <dualli@chromium.org>, dualli@google.com, corbet@lwn.net, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com, gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, maco@android.com, joel@joelfernandes.org, brauner@kernel.org, cmllamas@google.com, surenb@google.com, omosnace@redhat.com, shuah@kernel.org, arnd@arndb.de, masahiroy@kernel.org, bagasdotme@gmail.com, horms@kernel.org, tweek@google.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, netdev@vger.kernel.org, selinux@vger.kernel.org, linux-security-module@vger.kernel.org, hridya@google.com
Cc: smoreland@google.com, ynaffit@google.com, kernel-team@android.com
Subject: Re: [PATCH v17 1/3] lsm, selinux: Add setup_report permission to  binder
References: <20250417002005.2306284-2-dualli@chromium.org>
In-Reply-To: <20250417002005.2306284-2-dualli@chromium.org>

On Apr 16, 2025 Li Li <dualli@chromium.org> wrote:
> 
> Introduce a new permission "setup_report" to the "binder" class.
> This persmission controls the ability to set up the binder generic
> netlink driver to report certain binder transactions.
> 
> Signed-off-by: Thiébaud Weksteen <tweek@google.com>
> Signed-off-by: Li Li <dualli@google.com>
> ---
>  include/linux/lsm_hook_defs.h       |  1 +
>  include/linux/security.h            |  6 ++++++
>  security/security.c                 | 13 +++++++++++++
>  security/selinux/hooks.c            |  7 +++++++
>  security/selinux/include/classmap.h |  3 ++-
>  5 files changed, 29 insertions(+), 1 deletion(-)

When possible, it is helpful to include at least one caller in the patch
which adds a new LSM hook as it helps put the hook in context.  With that
in mind, I think it would be best to reorder this patchset so that patch
2/3 comes first and this patch comes second, with this patch including
the change to binder_nl_report_setup_doit() which adds the call to the
new LSM hook.

--
paul-moore.com

