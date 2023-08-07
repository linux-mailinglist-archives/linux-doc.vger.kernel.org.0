Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A76C771A98
	for <lists+linux-doc@lfdr.de>; Mon,  7 Aug 2023 08:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjHGGll (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Aug 2023 02:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjHGGlk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Aug 2023 02:41:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAC4BA;
        Sun,  6 Aug 2023 23:41:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C2DFB61554;
        Mon,  7 Aug 2023 06:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D911EC433C8;
        Mon,  7 Aug 2023 06:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691390498;
        bh=D1PYA+SIBAj6zDy2qHjqwZdn/DCEd0lZUWQARIceU+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HHZFQ+m0l/bxzUVDo+9Tdu92z32BIK9+g/UtInRRtlgCR8ncEsccMYf/bQRhWPPbV
         xK3/XG+NwrufxFgQ/72cqsWdnap7fZDD6DEoJEe8WR4KgWXtOChNdLrEi1FN8MqXHW
         mt8sZ8b6r4iAgWQuIcXv+gexGCgTodbYs6AUHavyZ4lzp3WLCJ7MRjqYEP3aY5XIp2
         N3GKxW+4gzpr6j1MI00bfeDW0oY2Y8WBsDx4Xkwe277M2TmdYNcQT8HFGeTRnT7A65
         23DpitUu0NwRB4jUbetVZdR0KucV3tZB/CEug0Wb5N2jWLYAKyW8D/frGlEcsvEOUh
         yQ/4ysj8ImSig==
Date:   Mon, 7 Aug 2023 08:41:35 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     dri-devel@lists.freedesktop.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 10/10] drm/panel: Update TODO list item for cleaning
 up prepared/enabled tracking
Message-ID: <wmdlcufscroz5tek2pbx5odhbx23bcu5hdnvfo3nuzo7nb3s2j@4kfea5hc6plp>
References: <20230804210644.1862287-1-dianders@chromium.org>
 <20230804140605.RFC.10.I104cdece7324b0c365e552a17f9883414ffaea01@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k2kyoksr53nbivxr"
Content-Disposition: inline
In-Reply-To: <20230804140605.RFC.10.I104cdece7324b0c365e552a17f9883414ffaea01@changeid>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--k2kyoksr53nbivxr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 04, 2023 at 02:06:13PM -0700, Douglas Anderson wrote:
> Now that most panels have been updated not to track/double-check their
> prepared/enabled state update the TODO with next steps.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
>  Documentation/gpu/todo.rst | 33 +++++++++++++--------------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
>=20
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 139980487ccf..c73d9dbebbf4 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -460,26 +460,19 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
> =20
>  Level: Starter
> =20
> -Clean up checks for already prepared/enabled in panels
> -------------------------------------------------------
> -
> -In a whole pile of panel drivers, we have code to make the
> -prepare/unprepare/enable/disable callbacks behave as no-ops if they've a=
lready
> -been called. To get some idea of the duplicated code, try::
> -
> -  git grep 'if.*>prepared' -- drivers/gpu/drm/panel
> -  git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> -
> -In the patch ("drm/panel: Check for already prepared/enabled in drm_pane=
l")
> -we've moved this check to the core. Now we can most definitely remove the
> -check from the individual panels and save a pile of code.
> -
> -In adition to removing the check from the individual panels, it is belie=
ved
> -that even the core shouldn't need this check and that should be consider=
ed
> -an error if other code ever relies on this check. The check in the core
> -currently prints a warning whenever something is relying on this check w=
ith
> -dev_warn(). After a little while, we likely want to promote this to a
> -WARN(1) to help encourage folks not to rely on this behavior.
> +Never double prepare/enable/disable/unprepare a panel
> +-----------------------------------------------------
> +
> +As of commit d2aacaf07395 ("drm/panel: Check for already prepared/enable=
d in
> +drm_panel"), we have a check in the drm_panel core to make sure nobody
> +double-calls prepare/enable/disable/unprepare. However, that extra doubl=
e-check
> +shouldn't be necessary. The caller should always be matching up calls of
> +prepare/unprepare and matching up calls of enable/disable.
> +
> +Hopefully the warning printed will encourage everyone to fix this. Event=
ually
> +we'll likely want to change this to a WARN_ON and (perhaps) fully remove=
 the
> +check. NOTE: even if we remove the double-check, drm_panel core still ne=
eds
> +to track the enabled/prepared state for its own purposes.

Detailing what those purposes are would be nice :)

Maxime

--k2kyoksr53nbivxr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZNCSHwAKCRDj7w1vZxhR
xXLpAP9cVeomxd1Lxa2v4osi9rmwuqN8GiTb7Nwlm9asySDXDAD9GR4fhvYrt/Zi
zUKPyZ3jB4jtwflLxARFu5GB3fzP+AM=
=DOcT
-----END PGP SIGNATURE-----

--k2kyoksr53nbivxr--
