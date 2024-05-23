Return-Path: <linux-doc+bounces-16805-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9990C8CD199
	for <lists+linux-doc@lfdr.de>; Thu, 23 May 2024 13:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13A661F2281D
	for <lists+linux-doc@lfdr.de>; Thu, 23 May 2024 11:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0764413BC23;
	Thu, 23 May 2024 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="YmfSnQud"
X-Original-To: linux-doc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC9A13BC18;
	Thu, 23 May 2024 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716465506; cv=none; b=st81tyy58tTVNHhmLTMpycHc9TVRsd1WebWUf8rHlEhFyFRWs/UFA0Ec7IOrKXk3SMh3Vor4qBeVzVlGUWSqDMgN3jIegYdv4OVmm0sW9evDKnh0dgHVeErevQm3r6sSxYriPVttSkoNqseYNCRRFRlTKvKCLob5qstpmwYZqeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716465506; c=relaxed/simple;
	bh=4nLV9Dyc/4A/RxBsua/JvOMKXeRqLUasZtQqN3igCzk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=kRzGuCmf5+GOXwOKx+isK9MwG0BNGFrS9/lGLXE2sKloI6obN+zu6iTFNz5QwV3qQgy9sVTdDwhOXbH+X8XeggEB7AYM4/mdn2xuiw6EsLKgvlTjpARH5Ca9jsRud18S5XZziO1U4jL0xZILUDjPlQm54wuEiupDGH0ESmP3yJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=YmfSnQud reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=QUBdeNRrqL3ceUPSW4Z5zFtbKSu0/iOTGYlKYtiJ5Bc=; b=Y
	mfSnQudUvoYAM5n1Am5P0u1QK10sQst9odx17lBPeEB2NPJ0E17nCkYX9PriYs3O
	QLtBXXs68TVtsBT+1+Ut+//zI5u54bcPhuco8kgJgAfJP6/NvSBIwYq/1/MRBnnd
	38nzflE1v38bhKybHZcrMgtXuBoTtnjmFudimVBKXg=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-140 (Coremail) ; Thu, 23 May 2024 19:56:59 +0800
 (CST)
Date: Thu, 23 May 2024 19:56:59 +0800 (CST)
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
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	"Sui Jingfeng" <sui.jingfeng@linux.dev>
Subject: Re:[PATCH v14 28/28] drm/sun4i: hdmi: Switch to HDMI connector
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-28-51950db4fedb@kernel.org>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-28-51950db4fedb@kernel.org>
X-NTES-SC: AL_Qu2aBPidukwq7yOZbekZnEobh+Y5UcK2s/ki2YFXN5k0hyXJ/ikYenh9A3Hv6sSAAhCNtx+aahdTwOZ2U4pBc5o4Re+fnzEqpvtIdRLck0ih
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <3ad87b41.a48f.18fa54fc43e.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3H+8LL09mdFlDAA--.13596W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwDnXmXAlZIk2wADsU
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpIE1heGltZSwKCkF0IDIwMjQtMDUtMjEgMTg6MTQ6MDEsICJNYXhpbWUgUmlwYXJkIiA8bXJp
cGFyZEBrZXJuZWwub3JnPiB3cm90ZToKPlRoZSBuZXcgSERNSSBjb25uZWN0b3IgaW5mcmFzdHJ1
Y3R1cmUgYWxsb3dzIHRvIHJlbW92ZSBzb21lIGJvaWxlcnBsYXRlLAo+ZXNwZWNpYWxseSB0byBn
ZW5lcmF0ZSBpbmZvZnJhbWVzLiBMZXQncyBzd2l0Y2ggdG8gaXQuCj4KPlJldmlld2VkLWJ5OiBK
ZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgo+QWNrZWQtYnk6IFN1aSBK
aW5nZmVuZyA8c3VpLmppbmdmZW5nQGxpbnV4LmRldj4KPlNpZ25lZC1vZmYtYnk6IE1heGltZSBS
aXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBBbmR5IFlhbiA8YW5keXNo
cmtAMTYzLmNvbT4KPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9zdW40aS9LY29uZmlnICAgICAgICAg
IHwgIDMgKysKPiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRtaV9lbmMuYyB8IDgxICsr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAyIGZpbGVzIGNoYW5nZWQsIDU0IGlu
c2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvS2NvbmZpZwo+aW5kZXgg
NDc0MWQ5ZjY1NDRjLi40MDM3ZTA4NTQzMGUgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0v
c3VuNGkvS2NvbmZpZwo+KysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL0tjb25maWcKPkBAIC0x
NiwxMCArMTYsMTMgQEAgY29uZmlnIERSTV9TVU40SQo+IGlmIERSTV9TVU40SQo+IAo+IGNvbmZp
ZyBEUk1fU1VONElfSERNSQo+IAl0cmlzdGF0ZSAiQWxsd2lubmVyIEExMC9BMTBzL0EyMC9BMzEg
SERNSSBDb250cm9sbGVyIFN1cHBvcnQiCj4gCWRlcGVuZHMgb24gQVJNIHx8IENPTVBJTEVfVEVT
VAo+KwlzZWxlY3QgRFJNX0RJU1BMQVlfSERNSV9IRUxQRVIKPisJc2VsZWN0IERSTV9ESVNQTEFZ
X0hETUlfU1RBVEVfSEVMUEVSCj4rCXNlbGVjdCBEUk1fRElTUExBWV9IRUxQRVIKPiAJZGVmYXVs
dCBEUk1fU1VONEkKPiAJaGVscAo+IAkgIENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBh
biBBbGx3aW5uZXIgQTEwL0ExMHMvQTIwL0EzMQo+IAkgIFNvQyB3aXRoIGFuIEhETUkgY29udHJv
bGxlci4KPiAKPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRtaV9l
bmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9oZG1pX2VuYy5jCj5pbmRleCAxYzZj
ZGEyYmZiMTQuLjBlNjUyZGQ0ODBjOSAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW40aV9oZG1pX2VuYy5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRt
aV9lbmMuYwo+QEAgLTM4LDM0ICszOCwyOCBAQAo+IAljb250YWluZXJfb2ZfY29uc3QoZSwgc3Ry
dWN0IHN1bjRpX2hkbWksIGVuY29kZXIpCj4gCj4gI2RlZmluZSBkcm1fY29ubmVjdG9yX3RvX3N1
bjRpX2hkbWkoYykJCVwKPiAJY29udGFpbmVyX29mX2NvbnN0KGMsIHN0cnVjdCBzdW40aV9oZG1p
LCBjb25uZWN0b3IpCj4gCj4tc3RhdGljIGludCBzdW40aV9oZG1pX3NldHVwX2F2aV9pbmZvZnJh
bWVzKHN0cnVjdCBzdW40aV9oZG1pICpoZG1pLAo+LQkJCQkJICAgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKm1vZGUpCj4rc3RhdGljIGludCBzdW40aV9oZG1pX3dyaXRlX2luZm9mcmFtZShzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAo+KwkJCQkgICAgICBlbnVtIGhkbWlfaW5mb2Zy
YW1lX3R5cGUgdHlwZSwKPisJCQkJICAgICAgY29uc3QgdTggKmJ1ZmZlciwgc2l6ZV90IGxlbikK
PiB7Cj4tCXN0cnVjdCBoZG1pX2F2aV9pbmZvZnJhbWUgZnJhbWU7Cj4tCXU4IGJ1ZmZlclsxN107
Cj4tCWludCBpLCByZXQ7Cj4rCXN0cnVjdCBzdW40aV9oZG1pICpoZG1pID0gZHJtX2Nvbm5lY3Rv
cl90b19zdW40aV9oZG1pKGNvbm5lY3Rvcik7Cj4rCWludCBpOwo+IAo+LQlyZXQgPSBkcm1faGRt
aV9hdmlfaW5mb2ZyYW1lX2Zyb21fZGlzcGxheV9tb2RlKCZmcmFtZSwKPi0JCQkJCQkgICAgICAg
JmhkbWktPmNvbm5lY3RvciwgbW9kZSk7Cj4tCWlmIChyZXQgPCAwKSB7Cj4tCQlEUk1fRVJST1Io
IkZhaWxlZCB0byBnZXQgaW5mb2ZyYW1lcyBmcm9tIG1vZGVcbiIpOwo+LQkJcmV0dXJuIHJldDsK
PisJaWYgKHR5cGUgIT0gSERNSV9JTkZPRlJBTUVfVFlQRV9BVkkpIHsKPisJCWRybV9lcnIoY29u
bmVjdG9yLT5kZXYsCj4rCQkJIlVuc3VwcG9ydGVkIGluZm9mcmFtZSB0eXBlOiAldVxuIiwgdHlw
ZSk7Cj4rCQlyZXR1cm4gMDsKPiAJfQo+IAo+LQlyZXQgPSBoZG1pX2F2aV9pbmZvZnJhbWVfcGFj
aygmZnJhbWUsIGJ1ZmZlciwgc2l6ZW9mKGJ1ZmZlcikpOwo+LQlpZiAocmV0IDwgMCkgewo+LQkJ
RFJNX0VSUk9SKCJGYWlsZWQgdG8gcGFjayBpbmZvZnJhbWVzXG4iKTsKPi0JCXJldHVybiByZXQ7
Cj4tCX0KPi0KPi0JZm9yIChpID0gMDsgaSA8IHNpemVvZihidWZmZXIpOyBpKyspCj4rCWZvciAo
aSA9IDA7IGkgPCBsZW47IGkrKykKPiAJCXdyaXRlYihidWZmZXJbaV0sIGhkbWktPmJhc2UgKyBT
VU40SV9IRE1JX0FWSV9JTkZPRlJBTUVfUkVHKGkpKTsKPiAKPiAJcmV0dXJuIDA7Cj4rCj4gfQo+
IAo+IHN0YXRpYyB2b2lkIHN1bjRpX2hkbWlfZGlzYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXIsCj4gCQkJICAgICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKPiB7Cj5A
QCAtODQsMTggKzc4LDIyIEBAIHN0YXRpYyB2b2lkIHN1bjRpX2hkbWlfZGlzYWJsZShzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gc3RhdGljIHZvaWQgc3VuNGlfaGRtaV9lbmFibGUoc3Ry
dWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+IAkJCSAgICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0
YXRlICpzdGF0ZSkKPiB7Cj4gCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlID0gJmVuY29k
ZXItPmNydGMtPnN0YXRlLT5hZGp1c3RlZF9tb2RlOwo+IAlzdHJ1Y3Qgc3VuNGlfaGRtaSAqaGRt
aSA9IGRybV9lbmNvZGVyX3RvX3N1bjRpX2hkbWkoZW5jb2Rlcik7Cj4tCXN0cnVjdCBkcm1fZGlz
cGxheV9pbmZvICpkaXNwbGF5ID0gJmhkbWktPmNvbm5lY3Rvci5kaXNwbGF5X2luZm87Cj4rCXN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IgPSAmaGRtaS0+Y29ubmVjdG9yOwo+KwlzdHJ1
Y3QgZHJtX2Rpc3BsYXlfaW5mbyAqZGlzcGxheSA9ICZjb25uZWN0b3ItPmRpc3BsYXlfaW5mbzsK
PisJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUgPQo+KwkJZHJtX2F0b21p
Y19nZXRfbmV3X2Nvbm5lY3Rvcl9zdGF0ZShzdGF0ZSwgY29ubmVjdG9yKTsKPisJdW5zaWduZWQg
bG9uZyBsb25nIHRtZHNfcmF0ZSA9IGNvbm5fc3RhdGUtPmhkbWkudG1kc19jaGFyX3JhdGU7Cj4g
CXVuc2lnbmVkIGludCB4LCB5Owo+IAl1MzIgdmFsID0gMDsKPiAKPiAJRFJNX0RFQlVHX0RSSVZF
UigiRW5hYmxpbmcgdGhlIEhETUkgT3V0cHV0XG4iKTsKPiAKPi0JY2xrX3NldF9yYXRlKGhkbWkt
Pm1vZF9jbGssIG1vZGUtPmNydGNfY2xvY2sgKiAxMDAwKTsKPi0JY2xrX3NldF9yYXRlKGhkbWkt
PnRtZHNfY2xrLCBtb2RlLT5jcnRjX2Nsb2NrICogMTAwMCk7Cj4rCWNsa19zZXRfcmF0ZShoZG1p
LT5tb2RfY2xrLCB0bWRzX3JhdGUpOwo+KwljbGtfc2V0X3JhdGUoaGRtaS0+dG1kc19jbGssIHRt
ZHNfcmF0ZSk7Cj4gCj4gCS8qIFNldCBpbnB1dCBzeW5jIGVuYWJsZSAqLwo+IAl3cml0ZWwoU1VO
NElfSERNSV9VTktOT1dOX0lOUFVUX1NZTkMsCj4gCSAgICAgICBoZG1pLT5iYXNlICsgU1VONElf
SERNSV9VTktOT1dOX1JFRyk7Cj4gCj5AQCAtMTQ0LDExICsxNDIsMTIgQEAgc3RhdGljIHZvaWQg
c3VuNGlfaGRtaV9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+IAo+IAl3cml0
ZWwodmFsLCBoZG1pLT5iYXNlICsgU1VONElfSERNSV9WSURfVElNSU5HX1BPTF9SRUcpOwo+IAo+
IAljbGtfcHJlcGFyZV9lbmFibGUoaGRtaS0+dG1kc19jbGspOwo+IAo+LQlzdW40aV9oZG1pX3Nl
dHVwX2F2aV9pbmZvZnJhbWVzKGhkbWksIG1vZGUpOwo+Kwlkcm1fYXRvbWljX2hlbHBlcl9jb25u
ZWN0b3JfaGRtaV91cGRhdGVfaW5mb2ZyYW1lcyhjb25uZWN0b3IsIHN0YXRlKTsKPisKPiAJdmFs
IHw9IFNVTjRJX0hETUlfUEtUX0NUUkxfVFlQRSgwLCBTVU40SV9IRE1JX1BLVF9BVkkpOwo+IAl2
YWwgfD0gU1VONElfSERNSV9QS1RfQ1RSTF9UWVBFKDEsIFNVTjRJX0hETUlfUEtUX0VORCk7Cj4g
CXdyaXRlbCh2YWwsIGhkbWktPmJhc2UgKyBTVU40SV9IRE1JX1BLVF9DVFJMX1JFRygwKSk7Cj4g
Cj4gCXZhbCA9IFNVTjRJX0hETUlfVklEX0NUUkxfRU5BQkxFOwo+QEAgLTE5NywyMyArMTk2LDI2
IEBAIHN0YXRpYyBpbnQgc3VuNGlfaGRtaV9jb25uZWN0b3JfYXRvbWljX2NoZWNrKHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19z
dGF0ZSA9IGNydGMtPnN0YXRlOwo+IAlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSA9ICZj
cnRjX3N0YXRlLT5hZGp1c3RlZF9tb2RlOwo+IAllbnVtIGRybV9tb2RlX3N0YXR1cyBzdGF0dXM7
Cj4gCj4gCXN0YXR1cyA9IHN1bjRpX2hkbWlfY29ubmVjdG9yX2Nsb2NrX3ZhbGlkKGNvbm5lY3Rv
ciwgbW9kZSwKPi0JCQkJCQkgIG1vZGUtPmNsb2NrICogMTAwMCk7Cj4rCQkJCQkJICBjb25uX3N0
YXRlLT5oZG1pLnRtZHNfY2hhcl9yYXRlKTsKPiAJaWYgKHN0YXR1cyAhPSBNT0RFX09LKQo+IAkJ
cmV0dXJuIC1FSU5WQUw7Cj4gCj4gCXJldHVybiAwOwo+IH0KPiAKPiBzdGF0aWMgZW51bSBkcm1f
bW9kZV9zdGF0dXMKPiBzdW40aV9oZG1pX2Nvbm5lY3Rvcl9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IsCj4gCQkJCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2Rl
KQo+IHsKPi0JcmV0dXJuIHN1bjRpX2hkbWlfY29ubmVjdG9yX2Nsb2NrX3ZhbGlkKGNvbm5lY3Rv
ciwgbW9kZSwKPi0JCQkJCQltb2RlLT5jbG9jayAqIDEwMDApOwo+Kwl1bnNpZ25lZCBsb25nIGxv
bmcgcmF0ZSA9Cj4rCQlkcm1fY29ubmVjdG9yX2hkbWlfY29tcHV0ZV9tb2RlX2Nsb2NrKG1vZGUs
IDgsCj4rCQkJCQkJICAgICAgSERNSV9DT0xPUlNQQUNFX1JHQik7Cj4rCj4rCXJldHVybiBzdW40
aV9oZG1pX2Nvbm5lY3Rvcl9jbG9ja192YWxpZChjb25uZWN0b3IsIG1vZGUsIHJhdGUpOwo+IH0K
PiAKPiBzdGF0aWMgaW50IHN1bjRpX2hkbWlfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IpCj4gewo+IAlzdHJ1Y3Qgc3VuNGlfaGRtaSAqaGRtaSA9IGRybV9jb25uZWN0
b3JfdG9fc3VuNGlfaGRtaShjb25uZWN0b3IpOwo+QEAgLTI1OSwxMCArMjYxLDE1IEBAIHN0YXRp
YyBzdHJ1Y3QgaTJjX2FkYXB0ZXIgKnN1bjRpX2hkbWlfZ2V0X2RkYyhzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4gCQlyZXR1cm4gRVJSX1BUUigtRVBST0JFX0RFRkVSKTsKPiAKPiAJcmV0dXJuIGRkYzsK
PiB9Cj4gCj4rc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hkbWlfZnVuY3Mgc3Vu
NGlfaGRtaV9oZG1pX2Nvbm5lY3Rvcl9mdW5jcyA9IHsKPisJLnRtZHNfY2hhcl9yYXRlX3ZhbGlk
CT0gc3VuNGlfaGRtaV9jb25uZWN0b3JfY2xvY2tfdmFsaWQsCj4rCS53cml0ZV9pbmZvZnJhbWUJ
PSBzdW40aV9oZG1pX3dyaXRlX2luZm9mcmFtZSwKPit9Owo+Kwo+IHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3Mgc3VuNGlfaGRtaV9jb25uZWN0b3JfaGVscGVy
X2Z1bmNzID0gewo+IAkuYXRvbWljX2NoZWNrCT0gc3VuNGlfaGRtaV9jb25uZWN0b3JfYXRvbWlj
X2NoZWNrLAo+IAkubW9kZV92YWxpZAk9IHN1bjRpX2hkbWlfY29ubmVjdG9yX21vZGVfdmFsaWQs
Cj4gCS5nZXRfbW9kZXMJPSBzdW40aV9oZG1pX2dldF9tb2RlcywKPiB9Owo+QEAgLTI4MCwxNSAr
Mjg3LDIwIEBAIHN1bjRpX2hkbWlfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yLCBib29sIGZvcmNlKQo+IAl9Cj4gCj4gCXJldHVybiBjb25uZWN0b3Jfc3Rh
dHVzX2Nvbm5lY3RlZDsKPiB9Cj4gCj4rc3RhdGljIHZvaWQgc3VuNGlfaGRtaV9jb25uZWN0b3Jf
cmVzZXQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPit7Cj4rCWRybV9hdG9taWNf
aGVscGVyX2Nvbm5lY3Rvcl9yZXNldChjb25uZWN0b3IpOwo+KwlfX2RybV9hdG9taWNfaGVscGVy
X2Nvbm5lY3Rvcl9oZG1pX3Jlc2V0KGNvbm5lY3RvciwgY29ubmVjdG9yLT5zdGF0ZSk7Cj4rfQo+
Kwo+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBzdW40aV9oZG1pX2Nv
bm5lY3Rvcl9mdW5jcyA9IHsKPiAJLmRldGVjdAkJCT0gc3VuNGlfaGRtaV9jb25uZWN0b3JfZGV0
ZWN0LAo+IAkuZmlsbF9tb2RlcwkJPSBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3Jf
bW9kZXMsCj4tCS5kZXN0cm95CQk9IGRybV9jb25uZWN0b3JfY2xlYW51cCwKPi0JLnJlc2V0CQkJ
PSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQsCj4rCS5yZXNldAkJCT0gc3VuNGlf
aGRtaV9jb25uZWN0b3JfcmVzZXQsCj4gCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlCT0gZHJtX2F0
b21pY19oZWxwZXJfY29ubmVjdG9yX2R1cGxpY2F0ZV9zdGF0ZSwKPiAJLmF0b21pY19kZXN0cm95
X3N0YXRlCT0gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsCj4gfTsK
PiAKPiAjaWZkZWYgQ09ORklHX0RSTV9TVU40SV9IRE1JX0NFQwo+QEAgLTY0MywxNCArNjU1LDIz
IEBAIHN0YXRpYyBpbnQgc3VuNGlfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IGRldmljZSAqbWFzdGVyLAo+IAkgICAgICAgaGRtaS0+YmFzZSArIFNVTjRJX0hETUlfQ0VDKTsK
PiAjZW5kaWYKPiAKPiAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZoZG1pLT5jb25uZWN0b3Is
Cj4gCQkJCSAmc3VuNGlfaGRtaV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKPi0JcmV0ID0gZHJt
X2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRybSwgJmhkbWktPmNvbm5lY3RvciwKPi0JCQkJCSAg
JnN1bjRpX2hkbWlfY29ubmVjdG9yX2Z1bmNzLAo+LQkJCQkJICBEUk1fTU9ERV9DT05ORUNUT1Jf
SERNSUEsCj4tCQkJCQkgIGhkbWktPmRkY19pMmMpOwo+KwlyZXQgPSBkcm1tX2Nvbm5lY3Rvcl9o
ZG1pX2luaXQoZHJtLCAmaGRtaS0+Y29ubmVjdG9yLAo+KwkJCQkgICAgICAgLyoKPisJCQkJCSog
Tk9URTogVGhvc2UgYXJlIGxpa2VseSB0byBiZQo+KwkJCQkJKiB3cm9uZywgYnV0IEkgY291bGRu
J3QgZmluZCB0aGUKPisJCQkJCSogYWN0dWFsIG9uZXMgaW4gdGhlIEJTUC4KPisJCQkJCSovCj4r
CQkJCSAgICAgICAiQVciLCAiSERNSSIsCj4rCQkJCSAgICAgICAmc3VuNGlfaGRtaV9jb25uZWN0
b3JfZnVuY3MsCj4rCQkJCSAgICAgICAmc3VuNGlfaGRtaV9oZG1pX2Nvbm5lY3Rvcl9mdW5jcywK
PisJCQkJICAgICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSwKPisJCQkJICAgICAgIGhkbWkt
PmRkY19pMmMsCj4rCQkJCSAgICAgICBCSVQoSERNSV9DT0xPUlNQQUNFX1JHQiksCj4rCQkJCSAg
ICAgICA4KTsKPiAJaWYgKHJldCkgewo+IAkJZGV2X2VycihkZXYsCj4gCQkJIkNvdWxkbid0IGlu
aXRpYWxpc2UgdGhlIEhETUkgY29ubmVjdG9yXG4iKTsKPiAJCWdvdG8gZXJyX2NsZWFudXBfY29u
bmVjdG9yOwo+IAl9Cj4KPi0tIAo+Mi40NS4wCg==

