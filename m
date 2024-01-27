Return-Path: <linux-doc+bounces-7646-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1DE83E876
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jan 2024 01:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24AAB284F1E
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jan 2024 00:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544A1635;
	Sat, 27 Jan 2024 00:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="n7CGtsvJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EE6623
	for <linux-doc@vger.kernel.org>; Sat, 27 Jan 2024 00:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706315347; cv=none; b=CHMF6EG8nOHBaUiiZW8/LC/T4U+5AdGzTRJadal9l+PDdehJS7IzSujGByuqWtQFTON2eYSRXrXCb6rqpWM4KMQ80bEDMQJBuI/yG4ilk46sWL5NsZcUPYHeA55iH4JaTmiKyXR1jaikvx/ZksgovsW91Plmgi2KNBbltE/IHT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706315347; c=relaxed/simple;
	bh=5sEVI83xY5mvEPW0c9LA+P8zBPvgkiJ/KHpqkDMlQSw=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=GnSlaHIlOkaRpb1U0B6t/zpdlVUGTGR9Bw/yEy1spvhnWYKUrxkmvjUBk40A08CJCTOV7Q6C/XW+V+U/T24v1iw+oe3P6I9OBGPlqbqaObLwrhfOGSQ2i3Bptge2wkc5XQCyaOnqhX0TT827zjd1U//4Xdc7lFFPLHwsvJ9SuX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=n7CGtsvJ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 77E2140EDA
	for <linux-doc@vger.kernel.org>; Sat, 27 Jan 2024 00:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1706315337;
	bh=2zuptboPtpFHfDSk/+RxWCV8mwfG174WDOUFcRIK/LA=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID;
	b=n7CGtsvJX5lFAlCs7MaSBUMfuJa4Qu//XUO9I+dFs3GttetGEryGA6w28lcycBca0
	 7KU8SNBKz7w004tK1qecQumTfeTo5EGgPq2C72Bk3CA+nVT0nWd/RTnO1A+xkoOpn0
	 rgr8892P004yOmosGWQIZghA4zl94oiDFFVJQtD1kjUVeFTHhoE2b/099M0gdUT5v3
	 9cESHwMQWfVMg3Q83lJQFhfpm2aQJ61ttyTr3Epau1KZADhdR1YLi9vh19jiUitDtZ
	 g/smXMBCdcvE/lcrSQesdJgelTZAIcdWRG6lxkPJyD1aJXnzjrdEagVsCqcU02oDWI
	 AXgzI4fyyqsyQ==
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6ddeebf1e23so1776510a34.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Jan 2024 16:28:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706315336; x=1706920136;
        h=message-id:date:content-transfer-encoding:content-id:mime-version
         :comments:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2zuptboPtpFHfDSk/+RxWCV8mwfG174WDOUFcRIK/LA=;
        b=HIYOG2eFsVW2G1aq/GuljhYZB/RDWSeZDn6ZOLYEtMB7iwxPMhr15dA5d/zhgOhYTI
         coWTFOihAPCzbgJ+KAPt3gu1RzoV320c99rr7KH/qBienjo/+cv6kl91voR6utp3+bEx
         atYUHTQ8NycxzqIVPYrfumTODBtwoE+/5sK6aR82aUyV2yC/981iQgi8fR7PYSkGzXIP
         O2DTNE7ys+uKMs3xC/tSykrTjRmGt6nM1cld8xFlqqV2dS+FkgpPGCcoNmmIvWq7W0Mz
         ugQ/FH0N9R2wJ5z+VId+zElx3zETU6rcof5udOD60UjSHAuXaeJnSaIS68/0vgJkqpq0
         i2Kw==
X-Gm-Message-State: AOJu0YwLoz2eWF+viLOqMZrHHxQ5h5SX9EQr2rMsdEFIkziN3yw93laS
	22Rh563celANlw4teUnAG4Qr5eoncWk3uw/AZnYs5dJO1/hALiejgiva1raCZ0oBXHgS56NltLt
	YIelVv1xvQfDt1ySSMjqr6IK29nJYbwtfa1wlyjNHgzwYxyLE+4v3ZL2WR2fARZfbqKrATw4gNw
	==
X-Received: by 2002:a9d:7357:0:b0:6db:cffe:8e8b with SMTP id l23-20020a9d7357000000b006dbcffe8e8bmr615359otk.10.1706315336228;
        Fri, 26 Jan 2024 16:28:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUfOnZGAiFGpCrG45elfBXGx2d9Hp07QRzna4M9tsXtxq/mI6ptycgdeexO2oAnUbioKTH2A==
X-Received: by 2002:a9d:7357:0:b0:6db:cffe:8e8b with SMTP id l23-20020a9d7357000000b006dbcffe8e8bmr615343otk.10.1706315335994;
        Fri, 26 Jan 2024 16:28:55 -0800 (PST)
Received: from famine.localdomain ([50.125.80.253])
        by smtp.gmail.com with ESMTPSA id ln8-20020a056a003cc800b006dddf2ed8f0sm1670154pfb.154.2024.01.26.16.28.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jan 2024 16:28:55 -0800 (PST)
Received: by famine.localdomain (Postfix, from userid 1000)
	id 29ADB5FFF6; Fri, 26 Jan 2024 16:28:55 -0800 (PST)
Received: from famine (localhost [127.0.0.1])
	by famine.localdomain (Postfix) with ESMTP id 237949FB50;
	Fri, 26 Jan 2024 16:28:55 -0800 (PST)
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
Subject: Re: [PATCH net-next v2 2/6] selftests: bonding: Add net/forwarding/lib.sh to TEST_INCLUDES
In-reply-to: <20240126232123.769784-3-bpoirier@nvidia.com>
References: <20240126232123.769784-1-bpoirier@nvidia.com> <20240126232123.769784-3-bpoirier@nvidia.com>
Comments: In-reply-to Benjamin Poirier <bpoirier@nvidia.com>
   message dated "Fri, 26 Jan 2024 18:21:19 -0500."
X-Mailer: MH-E 8.6+git; nmh 1.6; Emacs 29.0.50
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <11807.1706315335.1@famine>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jan 2024 16:28:55 -0800
Message-ID: <11808.1706315335@famine>

Benjamin Poirier <bpoirier@nvidia.com> wrote:

>In order to avoid duplicated files when both the bonding and forwarding
>tests are exported together, add net/forwarding/lib.sh to TEST_INCLUDES a=
nd
>include it via its relative path.
>
>Reviewed-by: Petr Machata <petrm@nvidia.com>
>Tested-by: Petr Machata <petrm@nvidia.com>
>Reviewed-by: Hangbin Liu <liuhangbin@gmail.com>
>Signed-off-by: Benjamin Poirier <bpoirier@nvidia.com>

Reviewed-by: Jay Vosburgh <jay.vosburgh@canonical.com>


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
> =

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

