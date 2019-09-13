Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A791BB25A6
	for <lists+linux-doc@lfdr.de>; Fri, 13 Sep 2019 21:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730300AbfIMTDj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 Sep 2019 15:03:39 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43173 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730268AbfIMTDi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Sep 2019 15:03:38 -0400
Received: by mail-pl1-f196.google.com with SMTP id 4so13621148pld.10
        for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2019 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=WbrTJOUc5fow26/05txxAkFKsoG+s+1MOG8nC+UoQHE=;
        b=Jx2b331YcQIB5XHOHcqhfFYzeFRlTXAa03ZGn4APJFHaGujwV0TUHrf32x3qXmnt6O
         EbdoyWnr2WC9j8WenYOeIYrS0m2fqTbyBBzfbQa/S2oZEUX7i06j08lVNafisBMUQm48
         gjBmdKswLD4qB9MlCWOVfTJR1bn/0P4qnbbMzd6ABM+kPGTmcSoslBTBhV2wuTK0Zi8l
         D3+CwOAwrl7ofWbkOhyxt1vO8f6pdE/cTUs1ll6C1R6OgW+n1gXhqnifBJYqEmkAMJ8V
         HtVnF2OWwKrQtneWvuSO6CyBl+Io+/pASdF31FsHcI0YtkWg2+R4gCIyLPHtP2IMKSeI
         kGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=WbrTJOUc5fow26/05txxAkFKsoG+s+1MOG8nC+UoQHE=;
        b=DXSWBJTc2vx2wxk40rMcrDbcSGOSOxHwyTo2M2e5/WBSd37k+Y8oF563VNXf9v4Ejl
         Kv4DAvzz6x8xzg0DrCquNipN+no36DuLEp/rL+6RYvKfhMi+cmzd2/oReIIy+RPbURas
         OQn3EE8KpPBT88Fi0Xo2wpg3SFFJG9QzhOTXfVWeAdNzLJ4vrQoKRZy5pB9bEF1kCgah
         15081SSPkKmq3eHduiForrX2B1CvSYAowQQBRVtlZckpy90fo6ZrTx0kzK0iaOEmCvjH
         uas/pcF6/pRWEfmcWkPHNgNS1V/qpo45jh8GVxVO1yxf/GmsojTzCKC03YJQcbsphqzZ
         uPlA==
X-Gm-Message-State: APjAAAWyfR7E8/RbQ7wDc6XBioIMbqt1/U05FT4gmS4SPDiR218/M5xr
        eiIslrv3gk0KiQQ4jAhJUQgxPEHqwpE=
X-Google-Smtp-Source: APXvYqwNcEpgp1tn+eOxWrPilX5NmCs+GwiEMgBuEnPIsqLwbmNBY34fxWPa+cFebILuHRGPshoZbQ==
X-Received: by 2002:a17:902:d70b:: with SMTP id w11mr50019606ply.313.1568401416649;
        Fri, 13 Sep 2019 12:03:36 -0700 (PDT)
Received: from ?IPv6:2600:380:7650:9a3f:9db9:3552:f45d:5be1? ([2600:380:7650:9a3f:9db9:3552:f45d:5be1])
        by smtp.gmail.com with ESMTPSA id u4sm26448972pfh.55.2019.09.13.12.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2019 12:03:35 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Jens Axboe <axboe@kernel.dk>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 0/4] null_blk: fixes around nr_devices and log improvements
Date:   Fri, 13 Sep 2019 12:03:34 -0700
Message-Id: <FFDFD18F-C242-46D2-B64B-5515987AD82D@kernel.dk>
References: <20190913185746.337429-1-andrealmeid@collabora.com>
Cc:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net, kernel@collabora.com,
        krisman@collabora.com
In-Reply-To: <20190913185746.337429-1-andrealmeid@collabora.com>
To:     =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
X-Mailer: iPhone Mail (17A5837a)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sep 13, 2019, at 11:58 AM, Andr=C3=A9 Almeida <andrealmeid@collabora.com>=
 wrote:
>=20
> =EF=BB=BFHello,
>=20
> This patch series address feedback for a previous patch series sent by
> me "docs: block: null_blk: enhance document style"[1].
>=20
> First patch removes a restriction that prevents null_blk to load with
> (nr_devices =3D=3D 0). This restriction breaks applications, so it's a bug=
. I
> have tested it running the kernel with `null_blk.nr_devices=3D0`.
>=20
> In the previous series I have changed the type of var nr_devices, but I
> forgot to change the type at module_param(). The second patch fix that.
>=20
> The third patch uses a cleaver approach to make log messages consistent
> using pr_fmt and the last one add a note on how to do that at the
> coding style documentation.

Please add Fixes tags to your patches.=20

