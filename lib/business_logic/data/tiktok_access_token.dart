class TikTokAccessToken {
  final String accessToken, openId, refreshToken;
  final int expires, refreshExpires;

  /// Most likely won't use refresh token but would be nice to keep?
  TikTokAccessToken(this.accessToken, this.openId, this.refreshToken,
      this.expires, this.refreshExpires);

  TikTokAccessToken.fromJSON(Map<String, dynamic> json)
      : accessToken = json['access_token'] ?? '',
        openId = json['open_id'] ?? '',
        refreshToken = json['refresh_token'] ?? '',
        expires = json['expires_in'] ?? 0,
        refreshExpires = json['refresh_expires_in'] ?? 0;
}
