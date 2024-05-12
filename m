Return-Path: <linux-doc+bounces-16255-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5298C35B4
	for <lists+linux-doc@lfdr.de>; Sun, 12 May 2024 10:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30DC51C20A3B
	for <lists+linux-doc@lfdr.de>; Sun, 12 May 2024 08:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C1C1C01;
	Sun, 12 May 2024 08:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="ZIjDaLCE"
X-Original-To: linux-doc@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD381C680;
	Sun, 12 May 2024 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715502674; cv=none; b=qIoA0yBxWaeOzyYUcDuuyk5TBjzZTjydRsRUUueZTgTcGY4OpoEYrm/S+jK5f4qgOi1Ot4aveO7Ix9gtfn+7wDX1f6RXi9lbAy2HsdXirlG7MlX0vHr8pitUUUAE06YFkGgGCMn91nUNCBPwsjEm2cuZ7g6wDqfBOaP1ALuwBSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715502674; c=relaxed/simple;
	bh=QpOOrNPMH0OuuUNSQ4ayH+9hc73A/isxh8Kz1LIOC/M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=bILQGMwshFONbJLRgEj8MKwFxmcKBQftOPmsBwFs559PoJ3FGw4+9I7ZMHdchy0HViN4x/VCoCnTLI4D6kBbfjC8NgBc72Ydy2ONFzaH1vCYp6942umuIcAjrWFi/cUjKDgL+DibrFrZ5op7+ZAo1xdpL0oNQXJHZV0qh3uRkH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=ZIjDaLCE reason="signature verification failed"; arc=none smtp.client-ip=45.254.50.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=laQYefkku3gVwt8bMMDsCuBt7YXFxaCqejXoM5vQ4W4=; b=Z
	IjDaLCEaRuCWq3ETlfqalEf5VujhfSfQvhODF3naoLI/papZfPOAhb1wAS3CAThi
	Wi1m75Un/rkdoQcN9IUPPE/sIRIWczncmigVlG0JhAVX/66TGvXm5czyNNWV2otW
	09oO6eykb+hcVJfAFMJuAgW94d1vAvsmeaGkZxq3pI=
Received: from andyshrk$163.com ( [103.29.142.67] ) by
 ajax-webmail-wmsvr-40-121 (Coremail) ; Sun, 12 May 2024 16:29:47 +0800
 (CST)
Date: Sun, 12 May 2024 16:29:47 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, 
	"Thomas Zimmermann" <tzimmermann@suse.de>, 
	"David Airlie" <airlied@gmail.com>, 
	"Daniel Vetter" <daniel@ffwll.ch>, 
	"Jonathan Corbet" <corbet@lwn.net>, 
	"Sandy Huang" <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	"Chen-Yu Tsai" <wens@csie.org>, 
	"Jernej Skrabec" <jernej.skrabec@gmail.com>, 
	"Samuel Holland" <samuel@sholland.org>, 
	"Andy Yan" <andy.yan@rock-chips.com>, 
	"Hans Verkuil" <hverkuil@xs4all.nl>, 
	"Sebastian Wick" <sebastian.wick@redhat.com>, 
	=?UTF-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re:[PATCH v13 27/28] drm/rockchip: inno_hdmi: Switch to HDMI
 connector
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240507-kms-hdmi-connector-state-v13-27-8fafc5efe8be@kernel.org>
References: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
 <20240507-kms-hdmi-connector-state-v13-27-8fafc5efe8be@kernel.org>
X-NTES-SC: AL_Qu2aB/mbvU0j4SKaYukZnEobh+Y5UcK2s/ki2YFXN5k0kiTIwAsfYWZeB3v3zsWCGgGlqQGVcDpD0Pp9R4t8TZkAHubVysdUlb/POX51X+YZ
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2d3073ce.16e2.18f6bec1d61.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD338T7fUBmWJopAA--.47081W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEBzcXmVOD6eJvQADs6
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpIE1heGltZSwKCkF0IDIwMjQtMDUtMDcgMjE6MTc6NDUsICJNYXhpbWUgUmlwYXJkIiA8bXJp
cGFyZEBrZXJuZWwub3JnPiB3cm90ZToKPlRoZSBuZXcgSERNSSBjb25uZWN0b3IgaW5mcmFzdHJ1
Y3R1cmUgYWxsb3dzIHRvIHJlbW92ZSBzb21lIGJvaWxlcnBsYXRlLAo+ZXNwZWNpYWxseSB0byBn
ZW5lcmF0ZSBpbmZvZnJhbWVzLiBMZXQncyBzd2l0Y2ggdG8gaXQuCj4KPlJldmlld2VkLWJ5OiBI
ZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+QWNrZWQtYnk6IEhlaWtvIFN0dWVibmVy
IDxoZWlrb0BzbnRlY2guZGU+Cj5TaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJk
QGtlcm5lbC5vcmc+Cj4tLS0KPiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvS2NvbmZpZyAgICAg
ICB8ICAgMyArCj4gZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRtaS5jICAgfCAxNTMg
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjRpX2hkbWlfZW5jLmMgfCAgIDMgKwo+IDMgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9u
cygrKSwgOTggZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9LY29uZmlnCj5pbmRleCAx
YmYzZTI4MjljZDAuLjdkZjg3NWUzODUxNyAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9LY29uZmlnCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvS2NvbmZpZwo+
QEAgLTcyLDEwICs3MiwxMyBAQCBjb25maWcgUk9DS0NISVBfRFdfTUlQSV9EU0kKPiAJICBlbmFi
bGUgTUlQSSBEU0kgb24gUkszMjg4IG9yIFJLMzM5OSBiYXNlZCBTb0MsIHlvdSBzaG91bGQKPiAJ
ICBzZWxlY3QgdGhpcyBvcHRpb24uCj4gCj4gY29uZmlnIFJPQ0tDSElQX0lOTk9fSERNSQo+IAli
b29sICJSb2NrY2hpcCBzcGVjaWZpYyBleHRlbnNpb25zIGZvciBJbm5vc2lsaWNvbiBIRE1JIgo+
KwlzZWxlY3QgRFJNX0RJU1BMQVlfSERNSV9IRUxQRVIKPisJc2VsZWN0IERSTV9ESVNQTEFZX0hE
TUlfU1RBVEVfSEVMUEVSCj4rCXNlbGVjdCBEUk1fRElTUExBWV9IRUxQRVIKPiAJaGVscAo+IAkg
IFRoaXMgc2VsZWN0cyBzdXBwb3J0IGZvciBSb2NrY2hpcCBTb0Mgc3BlY2lmaWMgZXh0ZW5zaW9u
cwo+IAkgIGZvciB0aGUgSW5ub3NpbGljb24gSERNSSBkcml2ZXIuIElmIHlvdSB3YW50IHRvIGVu
YWJsZQo+IAkgIEhETUkgb24gUkszMDM2IGJhc2VkIFNvQywgeW91IHNob3VsZCBzZWxlY3QgdGhp
cyBvcHRpb24uCj4gCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9f
aGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRtaS5jCj5pbmRleCAzZGYy
Y2ZjZjk5OTguLjUwNjk0MDNjM2I4MCAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9pbm5vX2hkbWkuYwo+KysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRt
aS5jCj5AQCAtMjAsMTAgKzIwLDEzIEBACj4gI2luY2x1ZGUgPGRybS9kcm1fZWRpZC5oPgo+ICNp
bmNsdWRlIDxkcm0vZHJtX29mLmg+Cj4gI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+
Cj4gI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaD4KPiAKPisjaW5jbHVkZSA8
ZHJtL2Rpc3BsYXkvZHJtX2hkbWlfaGVscGVyLmg+Cj4rI2luY2x1ZGUgPGRybS9kaXNwbGF5L2Ry
bV9oZG1pX3N0YXRlX2hlbHBlci5oPgo+KwouLi4uLi4KPiAKPiBzdGF0aWMgaW50IGlubm9faGRt
aV9jb25maWdfdmlkZW9fY3NjKHN0cnVjdCBpbm5vX2hkbWkgKmhkbWkpCj4gewo+IAlzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gJmhkbWktPmNvbm5lY3RvcjsKPiAJc3RydWN0IGRy
bV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUgPSBjb25uZWN0b3ItPnN0YXRlOwo+QEAgLTM1
OSwxMiArMzIzLDEyIEBAIHN0YXRpYyBpbnQgaW5ub19oZG1pX2NvbmZpZ192aWRlb19jc2Moc3Ry
dWN0IGlubm9faGRtaSAqaGRtaSkKPiAJdmFsdWUgPSB2X1ZJREVPX0lOUFVUX0JJVFMoVklERU9f
SU5QVVRfOEJJVFMpIHwKPiAJCXZfVklERU9fT1VUUFVUX0NPTE9SKDApIHwKPiAJCXZfVklERU9f
SU5QVVRfQ1NQKDApOwo+IAloZG1pX3dyaXRlYihoZG1pLCBIRE1JX1ZJREVPX0NPTlRSTDIsIHZh
bHVlKTsKPiAKPi0JaWYgKGlubm9fY29ubl9zdGF0ZS0+ZW5jX291dF9mb3JtYXQgPT0gSERNSV9D
T0xPUlNQQUNFX1JHQikgewo+LQkJaWYgKGlubm9fY29ubl9zdGF0ZS0+cmdiX2xpbWl0ZWRfcmFu
Z2UpIHsKPisJaWYgKGNvbm5fc3RhdGUtPmhkbWkub3V0cHV0X2Zvcm1hdCA9PSBIRE1JX0NPTE9S
U1BBQ0VfUkdCKSB7Cj4rCQlpZiAoY29ubl9zdGF0ZS0+aGRtaS5pc19saW1pdGVkX3JhbmdlKSB7
Cj4gCQkJY3NjX21vZGUgPSBDU0NfUkdCXzBfMjU1X1RPX1JHQl8xNl8yMzVfOEJJVDsKPiAJCQlh
dXRvX2NzYyA9IEFVVE9fQ1NDX0RJU0FCTEU7Cj4gCQkJYzBfYzJfY2hhbmdlID0gQzBfQzJfQ0hB
TkdFX0RJU0FCTEU7Cj4gCQkJY3NjX2VuYWJsZSA9IHZfQ1NDX0VOQUJMRTsKPiAKPkBAIC0zNzgs
MTggKzM0MiwxOCBAQCBzdGF0aWMgaW50IGlubm9faGRtaV9jb25maWdfdmlkZW9fY3NjKHN0cnVj
dCBpbm5vX2hkbWkgKmhkbWkpCj4gCQkJCSAgdl9WSURFT19DMF9DMl9TV0FQKEMwX0MyX0NIQU5H
RV9ESVNBQkxFKSk7Cj4gCQkJcmV0dXJuIDA7Cj4gCQl9Cj4gCX0gZWxzZSB7Cj4gCQlpZiAoaW5u
b19jb25uX3N0YXRlLT5jb2xvcmltZXRyeSA9PSBIRE1JX0NPTE9SSU1FVFJZX0lUVV82MDEpIHsK
Pi0JCQlpZiAoaW5ub19jb25uX3N0YXRlLT5lbmNfb3V0X2Zvcm1hdCA9PSBIRE1JX0NPTE9SU1BB
Q0VfWVVWNDQ0KSB7Cj4rCQkJaWYgKGNvbm5fc3RhdGUtPmhkbWkub3V0cHV0X2Zvcm1hdCA9PSBI
RE1JX0NPTE9SU1BBQ0VfWVVWNDQ0KSB7Cj4gCQkJCWNzY19tb2RlID0gQ1NDX1JHQl8wXzI1NV9U
T19JVFU2MDFfMTZfMjM1XzhCSVQ7Cj4gCQkJCWF1dG9fY3NjID0gQVVUT19DU0NfRElTQUJMRTsK
PiAJCQkJYzBfYzJfY2hhbmdlID0gQzBfQzJfQ0hBTkdFX0RJU0FCTEU7Cj4gCQkJCWNzY19lbmFi
bGUgPSB2X0NTQ19FTkFCTEU7Cj4gCQkJfQo+IAkJfSBlbHNlIHsKPi0JCQlpZiAoaW5ub19jb25u
X3N0YXRlLT5lbmNfb3V0X2Zvcm1hdCA9PSBIRE1JX0NPTE9SU1BBQ0VfWVVWNDQ0KSB7Cj4rCQkJ
aWYgKGNvbm5fc3RhdGUtPmhkbWkub3V0cHV0X2Zvcm1hdCA9PSBIRE1JX0NPTE9SU1BBQ0VfWVVW
NDQ0KSB7Cj4gCQkJCWNzY19tb2RlID0gQ1NDX1JHQl8wXzI1NV9UT19JVFU3MDlfMTZfMjM1XzhC
SVQ7Cj4gCQkJCWF1dG9fY3NjID0gQVVUT19DU0NfRElTQUJMRTsKPiAJCQkJYzBfYzJfY2hhbmdl
ID0gQzBfQzJfQ0hBTkdFX0RJU0FCTEU7Cj4gCQkJCWNzY19lbmFibGUgPSB2X0NTQ19FTkFCTEU7
Cj4gCQkJfQo+QEAgLTQ2MCwxNCArNDI0LDE2IEBAIHN0YXRpYyBpbnQgaW5ub19oZG1pX2NvbmZp
Z192aWRlb190aW1pbmcoc3RydWN0IGlubm9faGRtaSAqaGRtaSwKPiAKPiAJcmV0dXJuIDA7Cj4g
fQo+IAo+IHN0YXRpYyBpbnQgaW5ub19oZG1pX3NldHVwKHN0cnVjdCBpbm5vX2hkbWkgKmhkbWks
Cj4tCQkJICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCj4rCQkJICAgc3RydWN0IGRy
bV9jcnRjX3N0YXRlICpuZXdfY3J0Y19zdGF0ZSwKPisJCQkgICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
cl9zdGF0ZSAqbmV3X2Nvbm5fc3RhdGUpCj4gewo+LQlzdHJ1Y3QgZHJtX2Rpc3BsYXlfaW5mbyAq
ZGlzcGxheSA9ICZoZG1pLT5jb25uZWN0b3IuZGlzcGxheV9pbmZvOwo+LQl1bnNpZ25lZCBsb25n
IG1waXhlbGNsb2NrID0gbW9kZS0+Y2xvY2sgKiAxMDAwOwo+KwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yID0gJmhkbWktPmNvbm5lY3RvcjsKPisJc3RydWN0IGRybV9kaXNwbGF5X2lu
Zm8gKmRpc3BsYXkgPSAmY29ubmVjdG9yLT5kaXNwbGF5X2luZm87Cj4rCXN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICptb2RlID0gJm5ld19jcnRjX3N0YXRlLT5hZGp1c3RlZF9tb2RlOwo+IAo+IAkv
KiBNdXRlIHZpZGVvIGFuZCBhdWRpbyBvdXRwdXQgKi8KPiAJaGRtaV9tb2RiKGhkbWksIEhETUlf
QVZfTVVURSwgbV9BVURJT19NVVRFIHwgbV9WSURFT19CTEFDSywKPiAJCSAgdl9BVURJT19NVVRF
KDEpIHwgdl9WSURFT19NVVRFKDEpKTsKPiAKPkBAIC00NzcsMjYgKzQ0MywyNiBAQCBzdGF0aWMg
aW50IGlubm9faGRtaV9zZXR1cChzdHJ1Y3QgaW5ub19oZG1pICpoZG1pLAo+IAo+IAlpbm5vX2hk
bWlfY29uZmlnX3ZpZGVvX3RpbWluZyhoZG1pLCBtb2RlKTsKPiAKPiAJaW5ub19oZG1pX2NvbmZp
Z192aWRlb19jc2MoaGRtaSk7Cj4gCj4tCWlmIChkaXNwbGF5LT5pc19oZG1pKQo+LQkJaW5ub19o
ZG1pX2NvbmZpZ192aWRlb19hdmkoaGRtaSwgbW9kZSk7Cj4rCWRybV9hdG9taWNfaGVscGVyX2Nv
bm5lY3Rvcl9oZG1pX3VwZGF0ZV9pbmZvZnJhbWVzKGNvbm5lY3RvciwKPisJCQkJCQkJICAgbmV3
X2Nvbm5fc3RhdGUtPnN0YXRlKTsKPiAKCm5ld19jb25uX3N0YXRlLT5zdGF0ZSB3aWxsIGJlIHNl
dCBOVUxMIGluIGRybV9hdG9taWNfaGVscGVyX3N3YXBfc3RhdGUsCnNvIHRoaXMgd2lsbCBjYXVz
ZSBhIE5VTEwgcG9pbnRlciByZWZlcmVuY2UgcGFuaWMgaGVyZS4KCgo+IAkvKgo+IAkgKiBXaGVu
IElQIGNvbnRyb2xsZXIgaGF2ZSBjb25maWd1cmVkIHRvIGFuIGFjY3VyYXRlIHZpZGVvCj4gCSAq
IHRpbWluZywgdGhlbiB0aGUgVE1EUyBjbG9jayBzb3VyY2Ugd291bGQgYmUgc3dpdGNoZWQgdG8K
PiAJICogRENMS19MQ0RDLCBzbyB3ZSBuZWVkIHRvIGluaXQgdGhlIFRNRFMgcmF0ZSB0byBtb2Rl
IHBpeGVsCj4gCSAqIGNsb2NrIHJhdGUsIGFuZCByZWNvbmZpZ3VyZSB0aGUgRERDIGNsb2NrLgo+
IAkgKi8KPi0JaW5ub19oZG1pX2kyY19pbml0KGhkbWksIG1waXhlbGNsb2NrKTsKPisJaW5ub19o
ZG1pX2kyY19pbml0KGhkbWksIG5ld19jb25uX3N0YXRlLT5oZG1pLnRtZHNfY2hhcl9yYXRlKTsK
PiAKPiAJLyogVW5tdXRlIHZpZGVvIGFuZCBhdWRpbyBvdXRwdXQgKi8KPiAJaGRtaV9tb2RiKGhk
bWksIEhETUlfQVZfTVVURSwgbV9BVURJT19NVVRFIHwgbV9WSURFT19CTEFDSywKPiAJCSAgdl9B
VURJT19NVVRFKDApIHwgdl9WSURFT19NVVRFKDApKTsKPiAKPi0JaW5ub19oZG1pX3Bvd2VyX3Vw
KGhkbWksIG1waXhlbGNsb2NrKTsKPisJaW5ub19oZG1pX3Bvd2VyX3VwKGhkbWksIG5ld19jb25u
X3N0YXRlLT5oZG1pLnRtZHNfY2hhcl9yYXRlKTsKPiAKPiAJcmV0dXJuIDA7Cj4gfQo+IAoKPi0t
IAo+Mi40NS4wCj4KPgo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj5saW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcKPmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXJtLWtlcm5lbAo=

