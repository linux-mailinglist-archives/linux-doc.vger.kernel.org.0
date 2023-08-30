Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F4478DC1F
	for <lists+linux-doc@lfdr.de>; Wed, 30 Aug 2023 20:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238429AbjH3Shq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 30 Aug 2023 14:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245252AbjH3O5P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Aug 2023 10:57:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE0C198;
        Wed, 30 Aug 2023 07:57:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EFD9A624EC;
        Wed, 30 Aug 2023 14:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA762C433C8;
        Wed, 30 Aug 2023 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693407430;
        bh=hvNd6USN55C63Ho+Y1o3PyEx2EFP7F9vcDQbxMzgnHo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rlBpeLsGS4yzjCj6X53MRyUJ3jJYJUhuKn1S44WNd388z1wPi6LPKIyP0yikkPtrN
         OGgS1sGF1MQuxUQqAlzl+LUJ6l7LaluuE6f/Dr4lAn37hxYYJ00Dbb+AxhjHbop9Yp
         dqM+0Vnu+W9TF8tRFe9ptUidIjREnW/rP8L0SNM3kBB4/DIU5nT3HwAuyoxC7nmmhy
         i+HAnAy2AymEv99T3Z0kRSPL3YxelypUnZsyaicZIGURWVirMUnsjJVt3e7jcoSkfH
         Xk3+MCSyShvhvxLU4qCXZ8kxUXghXvZPOdB/xoCvwzCP87FNJ0W+eO3fJ6xNJGEmpJ
         QK71cMn6T1GNw==
Date:   Wed, 30 Aug 2023 16:57:07 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>, emma@anholt.net,
        linux-doc@vger.kernel.org, david.heidelberg@collabora.com,
        dri-devel@lists.freedesktop.org, jbrunet@baylibre.com,
        robdclark@google.com, corbet@lwn.net, khilman@baylibre.com,
        sergi.blanch.torne@collabora.com, gustavo.padovan@collabora.com,
        linux-rockchip@lists.infradead.org, daniels@collabora.com,
        martin.blumenstingl@googlemail.com, robclark@freedesktop.org,
        anholt@google.com, linux-mediatek@lists.infradead.org,
        matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
        guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
        tzimmermann@suse.de, alyssa@rosenzweig.io,
        vignesh.raman@collabora.com
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
Message-ID: <zmq7pz7rtz6h765azg5kl2qgjd264yafctx4q474t5tqai57og@cajbcub4yuwr>
References: <20230811171953.176431-1-helen.koike@collabora.com>
 <ZOTFfhtzzWkrQ23Y@phenom.ffwll.local>
 <zorvxwffshrsqx5cy76pe3gn52qrqav7qusz5acav2un2ydvwr@fwjd56qg2xve>
 <87bkeo23vs.fsf@intel.com>
 <4rpsqk4tgrdcxtxtfoum6o4oyglwkirmkh3jj4y5tays2ivb5p@uwqdf3snshkv>
 <25df6189-7b0a-b13d-e93d-c2a388fd45e3@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7ec3syeqgcjlux4q"
Content-Disposition: inline
In-Reply-To: <25df6189-7b0a-b13d-e93d-c2a388fd45e3@collabora.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--7ec3syeqgcjlux4q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 10:24:49AM -0300, Helen Koike wrote:
> Hi all,
>=20
> Thanks for you comments.
>=20
> On 30/08/2023 08:37, Maxime Ripard wrote:
> > On Wed, Aug 30, 2023 at 01:58:31PM +0300, Jani Nikula wrote:
> > > On Wed, 30 Aug 2023, Maxime Ripard <mripard@kernel.org> wrote:
> > > > On Tue, Aug 22, 2023 at 04:26:06PM +0200, Daniel Vetter wrote:
> > > > > On Fri, Aug 11, 2023 at 02:19:53PM -0300, Helen Koike wrote:
> > > > > > From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > > > > >=20
> > > > > > Developers can easily execute several tests on different devices
> > > > > > by just pushing their branch to their fork in a repository host=
ed
> > > > > > on gitlab.freedesktop.org which has an infrastructure to run jo=
bs
> > > > > > in several runners and farms with different devices.
> > > > > >=20
> > > > > > There are also other automated tools that uprev dependencies,
> > > > > > monitor the infra, and so on that are already used by the Mesa
> > > > > > project, and we can reuse them too.
> > > > > >=20
> > > > > > Also, store expectations about what the DRM drivers are supposed
> > > > > > to pass in the IGT test suite. By storing the test expectations
> > > > > > along with the code, we can make sure both stay in sync with ea=
ch
> > > > > > other so we can know when a code change breaks those expectatio=
ns.
> > > > > >=20
> > > > > > Also, include a configuration file that points to the out-of-tr=
ee
> > > > > > CI scripts.
> > > > > >=20
> > > > > > This will allow all contributors to drm to reuse the infrastruc=
ture
> > > > > > already in gitlab.freedesktop.org to test the driver on several
> > > > > > generations of the hardware.
> > > > > >=20
> > > > > > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > > > > > Signed-off-by: Helen Koike <helen.koike@collabora.com>
> > > > > > Acked-by: Daniel Stone <daniels@collabora.com>
> > > > > > Acked-by: Rob Clark <robdclark@gmail.com>
> > > > > > Tested-by: Rob Clark <robdclark@gmail.com>
> > > > >=20
> > > > > Ok I pushed this into a topic/drm-ci branch in drm.git and asked =
sfr to
> > > > > include that branch in linux-next.
> > > > >=20
> > > > > But also I'd like to see a lot more acks here, we should be able =
to at
> > > > > least pile up a bunch of (driver) maintainers from drm-misc in su=
pport of
> > > > > this. Also maybe media, at least I've heard noises that they're m=
aybe
> > > > > interested too? Plus anyone else, the more the better.
> > > >=20
> > > > I'm not really convinced by that approach at all, and most of the i=
ssues
> > > > I see are shown by the follow-up series here:
> > >=20
> > > I'm not fully convinced either, more like "let's see". In that narrow
> > > sense, ack. I don't see harm in trying, if you're also open to backing
> > > off in case it does not pan out.
> > >=20
> > > > https://lore.kernel.org/dri-devel/20230825122435.316272-1-vignesh.r=
aman@collabora.com/
> > > >=20
> > > >    * We hardcode a CI farm setup into the kernel
>=20
>=20
> These could be out of tree.
>=20
> There is a version outside the kernel tree where you just point the CI
> configuration to a url:
> https://gitlab.freedesktop.org/gfx-ci/drm-ci/-/merge_requests/1
>=20
> We were discussing it here https://www.linuxtv.org/cgi-bin/mailman/privat=
e/linuxtv-ci/2023-August/000027.html

It looks like it's private

> (I guess Sima's reply didn't got into the mailing list) but the argument =
of
> not having out of tree repo is due to historical bad experience of having=
 to
> sync the kernel with the code and it can become messy.

My point is that even though the test strategy might be considered a
"property" of the kernel, how you execute it is definitely not and you
will have as many setups as you have CI farms. You can't put that into
the kernel, just like we don't put the kernel command line in it for
example.

> > > >=20
> > > >    * We cannot trust that the code being run is actually the one be=
ing
> > > >      pushed into gitlab
>=20
>=20
> We can improve this if this is a requirement.
> For DTS configuration we can work with overlays (which is the current
> modification on that patchset). For other changes that are not suitable to
> upstream (and should be rare) we can see if we work with the
> `-external-fixes` approach or another approach, we can check it case by c=
ase
> to understand why it is not suitable for upstream.

The existence of that branch in itself is an issue to me. Again, it's a
matter of trust. How can I trust a branch I barely know about, of which
the development is not clear and isn't reviewed by any of the
maintainers of the code that might affect the test outcomes.

Or put another way, if I run the tests on my machine, it won't work. Why
should it work on the CI farm? The branch itself is broken. It might not
be due to any of the work I did, but it's broken still.

> > > >
> > > >    * IMO, and I know we disagree here, any IGT test we enable for a=
 given
> > > >      platform should work, period. Allowing failures and flaky test=
s just
> > > >      sweeps whatever issue is there under the rug. If the test is at
> > > >      fault, we should fix the test, if the driver / kernel is at fa=
ult,
> > > >      then I certainly want to know about it.
>
> I believe we need a baseline and understand the current status of tests. =
If
> you check the xfails folder in the patch you can see that I had to add a =
few
> tests on *-skips.txt since those tests crashes the system and other on
> *-fails.txt that are consistently not passing.

I agree that we need a baseline, but that baseline should be defined by
the tests own merits, not their outcome on a particular platform.

In other words, I want all drivers to follow that baseline, and if they
don't it's a bug we should fix, and we should be vocal about it. We
shouldn't ignore the test because it's broken.

Going back to the example I used previously, kms_hdmi_inject@inject-4k
shouldn't fail on mt8173, ever. That's a bug. Ignoring it and reporting
that "all tests are good" isn't ok. There's something wrong with that
driver and we should fix it.

Or at the very least, explain in much details what is the breakage, how
we noticed it, why we can't fix it, and how to reproduce it.

Because in its current state, there's no chance we'll ever go over that
test list and remove some of them. Or even know if, if we ever fix a bug
somewhere, we should remove a flaky or failing test.

> Since the "any IGT test we enable for a given platform should work" is no=
t a
> reality atm,

Thanks for the reality check, but it's very much doable: we're in
control of the test suite.

> we need to have a clear view about which tests are not corresponding
> to it, so we can start fixing. First we need to be aware of the issues
> so we can start fixing them, otherwise we will stay in the "no tests
> no failures" ground :)

I think we have somewhat contradicting goals. You want to make
regression testing, so whatever test used to work in the past should
keep working. That's fine, but it's different from "expectations about
what the DRM drivers are supposed to pass in the IGT test suite" which
is about validation, ie "all KMS drivers must behave this way".

I guess for regression you very much would like that all-green
dashboard, and it's understandable. For validation, we don't care and we
should be as vocal as possible to report broken drivers.

Eventually, we should have regression testing over the validation test
suite.

It's not about reality. We should be clear what we expect from those
test suites, and not claim that it's something it's not.

> > > At least for display, where this also depends on peripheral hardware,
> > > it's not an easy problem, really.
> >=20
> > Aside from the Chamelium tests, which tests actually rely on peripheral
> > hardware? On EDID and hotplug, sure, but that can easily be set up from
> > the userspace, or something like
> >=20
> > https://www.lindy-international.com/HDMI-2-0-EDID-Emulator.htm?websale8=
=3Dld0101.ld021102&pi=3D32115
> >=20
> > > How reliable do you need it to be? How many nines? Who is going to
> > > debug the issues that need hundreds or thousands of runs to reproduce?
> > > If a commit makes some test less reliable, how long is it going to
> > > take to even see that or pinpoint that?
> >=20
> > I mean, that's also true for failures or success then. How many times do
> > you need a test to run properly to qualify it as a meaningful test? How
> > do you know that it's not a flaky test?
> >=20
> > Ultimately, it's about trust. If, for a given test that just failed, I
> > can't be certain that it's because of the branch I just submitted, I
> > will just ignore the tests results after a while.
> >=20
> > This is already what plagues kernelci, and we should do better.
>
> This is something that is really nice on Mesa3D, a patch only gets merged=
 if
> tests passes, which forces people to not ignore it, which forces the code=
 to
> be fixed and the CI to be constantly maintained.
>=20
> Of course there are bad days there, but there is real value. Nice thread =
to
> check: https://gitlab.freedesktop.org/mesa/mesa/-/issues/8635 (thanks Aly=
ssa
> for the feedback).

I'm sure it works great for Mesa, but I'm also sure it doesn't ignore
CTS reports that a particular device isn't a valid OpenGL or Vulkan
implementation anymore.

> > And I'm sorry, but if some part of the kernel or driver just isn't
> > reliable, then we shouldn't claim it is (except for all the times it
> > isn't). If no-one has the time to look into it, fine, but flagging it
> > under a flaky test doesn't help anyone.
>
> At least we would know what is there that isn't reliable.

We would too if the test was reported as failed. But our preferred
approach to do so diverge.

Maxime

--7ec3syeqgcjlux4q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZO9YuwAKCRDj7w1vZxhR
xTjpAQCXnznNR0kerRl5Ng+uhQHuTUw4kVf1BDYBmz0qDPDkAwD/SjLSiPg4qZYr
X/ObWceHFsnKS9Q1QzhUri/hcHTamA0=
=Icx+
-----END PGP SIGNATURE-----

--7ec3syeqgcjlux4q--
