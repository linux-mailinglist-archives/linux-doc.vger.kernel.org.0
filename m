Return-Path: <linux-doc+bounces-7433-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A840783B12B
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jan 2024 19:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86A08B203D4
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jan 2024 18:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F82C12AAC5;
	Wed, 24 Jan 2024 18:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="CivZpzLK"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E848002E
	for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 18:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706120685; cv=none; b=TqQb0aej7rVToQZ+KQCfrrOCVAT57wjtcHUc0hYUpt6J2/tPvIGptzQ/jOv+Uakd6Y76RVH/Oycneh622aoP5F1MxuWqID7F4WiG4QtlL9ASYVsQfUfLstIKCkDDFYokKk40RHmGyaVxo/+Dtxus5I2Z3XgS1t3XiGCCJhVMlm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706120685; c=relaxed/simple;
	bh=d6GDc+QkNSrk9oyuCdAXMvGQPW/LMWt0q3wXnRE1Gzw=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=cAS2a+Okvd1coWj9Imf8BMlRIuhJb6oaeK3UM7M5c1Wc5UN4IDjQ7AW1kIpByQA9RGOQRxrUSZijRkhYoaEv0HzClQwbR21Dfl47ROIcqn8zGYxgjSWJlqhKlW0+PhJ/xh5oW69fqyslc1dQiSBlFTNEowJ+FDwHuDnYvzHKPc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=CivZpzLK; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8916440A15
	for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 18:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1706120680;
	bh=WFJAzGJpjiEflCT7uULX/fRESimoKCgcTGRqRm1jnZ0=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID;
	b=CivZpzLK4xcy6D7z2a+VnR6U9d1zg+BlQyYNI9tfEdax+dV+7b6QfPcD3zQQEutz2
	 MK85WspE7yHPi4OGws02b+imGpdZ04peFloVw7Epoht+QMu6KDfBjKlfqz5bv7p/IJ
	 3KPAyjRppgjIbv/paETflhHVJn5o5BcxYucdZsltJ0uVD1xJvff7VkL+/NzWHCh2EW
	 0ReLKGDCqRrKFwOIIVNb3xTxKqk8N4cet3z1rynmXKtrKZHh3j1HARDpgXn0cpfXdQ
	 NAmW+8tehSjnUpwSnx6PiKPy7ne/1a4CmcuAQj5TkWcpPKxuvonQTnY3jE45/NunC/
	 FtPNShRP8k0NA==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1d773abbf02so13175895ad.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 10:24:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706120679; x=1706725479;
        h=message-id:date:content-transfer-encoding:content-id:mime-version
         :comments:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WFJAzGJpjiEflCT7uULX/fRESimoKCgcTGRqRm1jnZ0=;
        b=Yk4O4Dw2ufj78CwfNlNBuSxUVnYd3CWoPRxryzA567IeLrk6d1NGfLRHXDM6nqR30P
         anVzZwkg4LdnP2TUHYsstQfGLMp6Hb4h/soaaS30k0FDbMZWu0CeVEdGmCfCSBmnSu67
         fBgQ0Yawl+rjeLHZo/IWOuLplBhdarg8m6XRO2DkV0XXqe2CEX6XmPIsKFCJEiIdzL4P
         WW2BxD5P77wxZMaxiZQuud2ZQdTfowvStJfKmz0XiVdj2IA1+c77g3PPsHgPfMs6T7om
         jTDe4hahgv3E8772URIDZ8a3xDoWQq8tDd/S3a/WuRCy9iJ1FhVe3cpoFDCPkjfQ28oc
         sT5g==
X-Gm-Message-State: AOJu0YxQSr+VRFvfpTIv8ygpmSqLB6XeP0X7MvB6XqRMM3u3eCHZe6TG
	hjT2c3VPZPrr3yvQE5WAjLgi9iPOFS78SCLkJzb5g8rKsm79pYhbBwbHjxkvjPOcVvgsIFEGQzp
	KTZLwXpzOQUnyIzPe4MZcivdYpjVGzl469yQqkXZrI/DcrqFxs7FzuDFyvz24Y5jF4cBj+f3tbA
	==
X-Received: by 2002:a17:902:e9c4:b0:1d7:3687:ca33 with SMTP id 4-20020a170902e9c400b001d73687ca33mr1175137plk.68.1706120679035;
        Wed, 24 Jan 2024 10:24:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOVgCZ+57YFrf80kfBTxr3WLJy7dvkAlYiXQXpAyKtlTZIwxzv+zgQyjCVZ5Zkb+L9cuUcRg==
X-Received: by 2002:a17:902:e9c4:b0:1d7:3687:ca33 with SMTP id 4-20020a170902e9c400b001d73687ca33mr1175120plk.68.1706120678727;
        Wed, 24 Jan 2024 10:24:38 -0800 (PST)
Received: from famine.localdomain ([50.125.80.253])
        by smtp.gmail.com with ESMTPSA id i5-20020a17090332c500b001d7715031f9sm2812198plr.171.2024.01.24.10.24.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jan 2024 10:24:38 -0800 (PST)
Received: by famine.localdomain (Postfix, from userid 1000)
	id D75A35FFF6; Wed, 24 Jan 2024 10:24:37 -0800 (PST)
Received: from famine (localhost [127.0.0.1])
	by famine.localdomain (Postfix) with ESMTP id CF99A9FB50;
	Wed, 24 Jan 2024 10:24:37 -0800 (PST)
From: Jay Vosburgh <jay.vosburgh@canonical.com>
To: Benjamin Poirier <bpoirier@nvidia.com>
cc: netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
    Jonathan Corbet <corbet@lwn.net>,
    Andy Gospodarek <andy@greyhouse.net>, Andrew Lunn <andrew@lunn.ch>,
    Florian Fainelli <f.fainelli@gmail.com>,
    Vladimir Oltean <olteanv@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>, Petr Machata <petrm@nvidia.com>,
    Danielle Ratson <danieller@nvidia.com>,
    Nikolay Aleksandrov <razor@blackwall.org>,
    Ido Schimmel <idosch@nvidia.com>,
    Johannes Nixdorf <jnixdorf-oss@avm.de>,
    Davide Caratti <dcaratti@redhat.com>,
    Tobias Waldekranz <tobias@waldekranz.com>,
    Zahari Doychev <zdoychev@maxlinear.com>,
    Hangbin Liu <liuhangbin@gmail.com>, linux-kselftest@vger.kernel.org,
    linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next 2/6] selftests: bonding: Add net/forwarding/lib.sh to TEST_INCLUDES
In-reply-to: <20240124170222.261664-3-bpoirier@nvidia.com>
References: <20240124170222.261664-1-bpoirier@nvidia.com> <20240124170222.261664-3-bpoirier@nvidia.com>
Comments: In-reply-to Benjamin Poirier <bpoirier@nvidia.com>
   message dated "Wed, 24 Jan 2024 12:02:18 -0500."
X-Mailer: MH-E 8.6+git; nmh 1.6; Emacs 29.0.50
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8204.1706120677.1@famine>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jan 2024 10:24:37 -0800
Message-ID: <8205.1706120677@famine>

Benjamin Poirier <bpoirier@nvidia.com> wrote:

>In order to avoid duplicated files when both the bonding and forwarding
>tests are exported together, add net/forwarding/lib.sh to TEST_INCLUDES a=
nd
>include it via its relative path.
>
>Reviewed-by: Petr Machata <petrm@nvidia.com>
>Tested-by: Petr Machata <petrm@nvidia.com>
>Signed-off-by: Benjamin Poirier <bpoirier@nvidia.com>
>---
> tools/testing/selftests/drivers/net/bonding/Makefile        | 6 ++++--
> .../selftests/drivers/net/bonding/bond-eth-type-change.sh   | 2 +-
> .../testing/selftests/drivers/net/bonding/bond_topo_2d1c.sh | 2 +-
> .../testing/selftests/drivers/net/bonding/dev_addr_lists.sh | 2 +-
> .../drivers/net/bonding/mode-1-recovery-updelay.sh          | 2 +-
> .../drivers/net/bonding/mode-2-recovery-updelay.sh          | 2 +-
> .../selftests/drivers/net/bonding/net_forwarding_lib.sh     | 1 -
> 7 files changed, 9 insertions(+), 8 deletions(-)
> delete mode 120000 tools/testing/selftests/drivers/net/bonding/net_forwa=
rding_lib.sh
>
>diff --git a/tools/testing/selftests/drivers/net/bonding/Makefile b/tools=
/testing/selftests/drivers/net/bonding/Makefile
>index 8a72bb7de70f..1e10a1f06faf 100644
>--- a/tools/testing/selftests/drivers/net/bonding/Makefile
>+++ b/tools/testing/selftests/drivers/net/bonding/Makefile
>@@ -15,7 +15,9 @@ TEST_PROGS :=3D \
> TEST_FILES :=3D \
> 	lag_lib.sh \
> 	bond_topo_2d1c.sh \
>-	bond_topo_3d1c.sh \
>-	net_forwarding_lib.sh
>+	bond_topo_3d1c.sh
>+
>+TEST_INCLUDES :=3D \
>+	../../../net/forwarding/lib.sh
> =

> include ../../../lib.mk
>diff --git a/tools/testing/selftests/drivers/net/bonding/bond-eth-type-ch=
ange.sh b/tools/testing/selftests/drivers/net/bonding/bond-eth-type-change=
.sh
>index 862e947e17c7..8293dbc7c18f 100755
>--- a/tools/testing/selftests/drivers/net/bonding/bond-eth-type-change.sh
>+++ b/tools/testing/selftests/drivers/net/bonding/bond-eth-type-change.sh
>@@ -11,7 +11,7 @@ ALL_TESTS=3D"
> REQUIRE_MZ=3Dno
> NUM_NETIFS=3D0
> lib_dir=3D$(dirname "$0")
>-source "$lib_dir"/net_forwarding_lib.sh
>+source "$lib_dir"/../../../net/forwarding/lib.sh
> =

> bond_check_flags()
> {
>diff --git a/tools/testing/selftests/drivers/net/bonding/bond_topo_2d1c.s=
h b/tools/testing/selftests/drivers/net/bonding/bond_topo_2d1c.sh
>index a509ef949dcf..0eb7edfb584c 100644
>--- a/tools/testing/selftests/drivers/net/bonding/bond_topo_2d1c.sh
>+++ b/tools/testing/selftests/drivers/net/bonding/bond_topo_2d1c.sh
>@@ -28,7 +28,7 @@
> REQUIRE_MZ=3Dno
> NUM_NETIFS=3D0
> lib_dir=3D$(dirname "$0")
>-source ${lib_dir}/net_forwarding_lib.sh
>+source "$lib_dir"/../../../net/forwarding/lib.sh

	Is there a way to pass TEST_INCLUDES via the environment or as a
parameter, so that it's not necessary to hard code the path name here
and in the similar cases below?

	-J

> s_ns=3D"s-$(mktemp -u XXXXXX)"
> c_ns=3D"c-$(mktemp -u XXXXXX)"
>diff --git a/tools/testing/selftests/drivers/net/bonding/dev_addr_lists.s=
h b/tools/testing/selftests/drivers/net/bonding/dev_addr_lists.sh
>index 5cfe7d8ebc25..e6fa24eded5b 100755
>--- a/tools/testing/selftests/drivers/net/bonding/dev_addr_lists.sh
>+++ b/tools/testing/selftests/drivers/net/bonding/dev_addr_lists.sh
>@@ -14,7 +14,7 @@ ALL_TESTS=3D"
> REQUIRE_MZ=3Dno
> NUM_NETIFS=3D0
> lib_dir=3D$(dirname "$0")
>-source "$lib_dir"/net_forwarding_lib.sh
>+source "$lib_dir"/../../../net/forwarding/lib.sh
> =

> source "$lib_dir"/lag_lib.sh
> =

>diff --git a/tools/testing/selftests/drivers/net/bonding/mode-1-recovery-=
updelay.sh b/tools/testing/selftests/drivers/net/bonding/mode-1-recovery-u=
pdelay.sh
>index b76bf5030952..9d26ab4cad0b 100755
>--- a/tools/testing/selftests/drivers/net/bonding/mode-1-recovery-updelay=
.sh
>+++ b/tools/testing/selftests/drivers/net/bonding/mode-1-recovery-updelay=
.sh
>@@ -23,7 +23,7 @@ REQUIRE_MZ=3Dno
> REQUIRE_JQ=3Dno
> NUM_NETIFS=3D0
> lib_dir=3D$(dirname "$0")
>-source "$lib_dir"/net_forwarding_lib.sh
>+source "$lib_dir"/../../../net/forwarding/lib.sh
> source "$lib_dir"/lag_lib.sh
> =

> cleanup()
>diff --git a/tools/testing/selftests/drivers/net/bonding/mode-2-recovery-=
updelay.sh b/tools/testing/selftests/drivers/net/bonding/mode-2-recovery-u=
pdelay.sh
>index 8c2619002147..2d275b3e47dd 100755
>--- a/tools/testing/selftests/drivers/net/bonding/mode-2-recovery-updelay=
.sh
>+++ b/tools/testing/selftests/drivers/net/bonding/mode-2-recovery-updelay=
.sh
>@@ -23,7 +23,7 @@ REQUIRE_MZ=3Dno
> REQUIRE_JQ=3Dno
> NUM_NETIFS=3D0
> lib_dir=3D$(dirname "$0")
>-source "$lib_dir"/net_forwarding_lib.sh
>+source "$lib_dir"/../../../net/forwarding/lib.sh
> source "$lib_dir"/lag_lib.sh
> =

> cleanup()
>diff --git a/tools/testing/selftests/drivers/net/bonding/net_forwarding_l=
ib.sh b/tools/testing/selftests/drivers/net/bonding/net_forwarding_lib.sh
>deleted file mode 120000
>index 39c96828c5ef..000000000000
>--- a/tools/testing/selftests/drivers/net/bonding/net_forwarding_lib.sh
>+++ /dev/null
>@@ -1 +0,0 @@
>-../../../net/forwarding/lib.sh
>\ No newline at end of file
>-- =

>2.43.0
>
>

