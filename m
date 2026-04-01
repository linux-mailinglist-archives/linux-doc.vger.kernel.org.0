Return-Path: <linux-doc+bounces-81981-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK2fEDPUzGlFWwYAu9opvQ
	(envelope-from <linux-doc+bounces-81981-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Apr 2026 10:15:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFD637692F
	for <lists+linux-doc@lfdr.de>; Wed, 01 Apr 2026 10:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D4B3307A304
	for <lists+linux-doc@lfdr.de>; Wed,  1 Apr 2026 08:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4E838B130;
	Wed,  1 Apr 2026 08:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqJKg0V1"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87086372ECC
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 08:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775030764; cv=none; b=SPQva3nreSnBaAzzRrfUjYd1qn6xWNBAOZ6MJnHq8pIDFBzFVqJlFXiYbUiOVOeU7B8VSRhdm/65slGECCMkzN1y6u6b2GI3+tLo6Zf8cSswV57QusVH/YGbOoZjq54eGT4SiTwHGUF3w8ZkuBTKXH7i/HXKKwRr9i5fJ5jw5Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775030764; c=relaxed/simple;
	bh=vCdXcNhvfsQLq7T5BRej3phIPgo6NGFMKQMcuPzGOwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tN+sk9jvB4vT0wREZwdQoVrij/UEaiTyctMndOH11c7sMrv3QssS0PI3wtWgWsWdBCOqkuhbovzrH3NYOUonufVrWhOLgG0hd1y2gkzrmPzc3osQtn+wfBs9cRbiVggcN3PBthlfY6EU17lEUB/EiXGytjOW0iItKKsEaYqCe8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqJKg0V1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F8CC2BC9E;
	Wed,  1 Apr 2026 08:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775030764;
	bh=vCdXcNhvfsQLq7T5BRej3phIPgo6NGFMKQMcuPzGOwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqJKg0V1L04Q3f38fKKOlIWP+9kJ7b9nPh/7SkiTWIFS5HV2ZmN4WBl1p7IWmMdpj
	 ozbqsG5VzM4xt9qwCtV8Lcg0Lfv31XkuUWJxO6UuEAB9rT+kyqIeAUdBi0Iqc2r9M2
	 XzMoJo+T19GRNpNB+5UA4Ies9Bfdt2aZwaeIVXQDscP+OmcNYEoKkV9SedZ+6L8IKQ
	 CT3KK/ci1Vi7Lxa+YgcOcm3UkKdiaKDm9Nkw9G8IuFcGnagw1P/upc0jH57Cd7O4eE
	 8iCQYg380dUf5Xpo3W4aBb1l4T6efuIN4USC1acqxTznac7+2CtR8tyh5Jxrf68iUW
	 tdo8P/vvB+4dg==
Date: Wed, 1 Apr 2026 10:06:01 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 1/2] drm: Rename drm_atomic_state
Message-ID: <20260401-imperial-tan-emu-0a1ab4@houat>
References: <20260331-drm-drm-atomic-update-v2-0-7e8fe6ddcd32@kernel.org>
 <20260331-drm-drm-atomic-update-v2-1-7e8fe6ddcd32@kernel.org>
 <316d8ab8-78d0-4169-9264-e4da5424b5d6@suse.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="cii5lvz5tahfk45i"
Content-Disposition: inline
In-Reply-To: <316d8ab8-78d0-4169-9264-e4da5424b5d6@suse.de>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81981-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,lwn.net,intel.com,ursulin.net,amd.com,oss.qualcomm.com,kernel.org,linaro.org,raspberrypi.com,ideasonboard.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CFD637692F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--cii5lvz5tahfk45i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] drm: Rename drm_atomic_state
MIME-Version: 1.0

Hi Thomas,

On Wed, Apr 01, 2026 at 08:05:12AM +0200, Thomas Zimmermann wrote:
> Am 31.03.26 um 16:41 schrieb Maxime Ripard:
> > The KMS framework uses two slightly different definitions for the state
> > concept. For a given object (plane, CRTC, encoder, etc., so
> > drm_$OBJECT_state), the state is the entire state of that object.
> > However, at the device level, drm_atomic_state refers to a state update
> > for a limited number of objects.
> >=20
> > Thus, drm_atomic_state isn't the entire device state, but only the full
> > state of some objects in that device. This has been an endless source of
> > confusion and thus bugs.
> >=20
> > We can rename drm_atomic_state to drm_atomic_commit to make it less
> > confusing.
>=20
> Nit: The subject should already spell out the new name.
>=20
> >=20
> > This patch was created using:
> >=20
> > rg -l drm_atomic_state | \
> > 	xargs sed -i 's/drm_atomic_state/drm_atomic_commit/g; s/drm_atomic_com=
mit_helper/drm_atomic_state_helper/g'
> > mv drivers/gpu/drm/tests/drm_atomic_state_test.c drivers/gpu/drm/tests/=
drm_atomic_commit_test.c
>=20
> We now have many places that read like "struct drm_atomic_commit *state',
> which mixes up terminology. Is there a way of transforming this
> automatically to use 'commit' for the variable's name?

I know what you're saying, but it would be much more intrusive and I'm
not sure I feel comfortable doing it in one go. I had a try this morning
to come up with a coccinelle script and it looks like it chokes up a bit
on it too.

I'm sure we could blame my coccinelle skills, but how about we do this
driver by driver later on? I can do it if you want me to, and we don't
really need to have that one big commit, it can be split into smaller
units that would be easier to test and merge.

Maxime

--cii5lvz5tahfk45i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaczR6AAKCRAnX84Zoj2+
diwJAX4uy/nV3NPKiK3qmQeMnzfxOpb6SoFRToie/uY1bnwzT4DvI1PBDpupJ2b7
1TPui7YBf0tYnfE8f570AUNIYHDpDbX7FlYZwmcTtk0dNFPKYel3cDoxReDbmNAk
0gu5asfI9w==
=BLVN
-----END PGP SIGNATURE-----

--cii5lvz5tahfk45i--

